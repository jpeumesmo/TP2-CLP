use Data::Dumper;
use feature 'switch';
no if $] >= 5.018, warnings => qw( experimental::smartmatch );
no warnings qw( experimental::autoderef );
use lib '/home/jpeumesmo/UFSJ/CLP/TP2';
use Aluno;
use Curso;
use Disciplina;
use Matricula;
#$aluno = Aluno->new("joao","jasda","asdas","asd");
#$curso = Curso->new("aa","a","a","c");
#$disciplna = Disciplina->new("aa","a","a","c");
#$matricula = Matricula->new("aa","a","a","c");
#$aluno->printar($aluno);
@alunos;
@cursos;
@disciplinas;
@matriculas;
%matriz;
$enter;
$menuControle = 1;
while ($menuControle != 0){
  print("SISTEMA DE GERENCIAMENTO DE ACADEMICO","\n");
  print("\n");
  print("\n");
  print("1- Menu de Alunos","\n","2- Menu de Cursos","\n","3- Menu de Disciplias","\n","4- Menu de Matriculas","\n","0- Sair","\n");
  print("\n");
  print("Digite a opcao desejada");
  print ("\n");
  $menuControle = <STDIN>;
  system("clear");
  given($menuControle){
    #ALUNOS
    when (1){
      $menuControleAluno = 1;
      while ($menuControleAluno != 0 ){
        print("Menu de Controle de Alunos \n");
        print("1- Adiconar Aluno\n","2- Alterar Aluno\n","3- Remover Aluno\n","4- Visualizar Alunos Cadastrados\n","0- Voltar\n");
        print("Digite a opcao desejada\n");
        $menuControleAluno = <STDIN>;
        system("clear");
        given($menuControleAluno){
          when (1){
            print ("Digite o nome do aluno: ");
            $nome = <STDIN>;
            print("\nDigite o email do aluno: ");
            $email = <STDIN>;
            print("\nDigite o rendimento academico do aluno: ");
            $RA = <STDIN>;
            $cursoEncontrado = 0;
            while($cursoEncontrado == 0){
              print ("\nDigite o Nome do Curso: ");
              $nomeCurso = <STDIN>;
              foreach $curso (@cursos){
                if (($curso->{nome} eq $nomeCurso) && $cursoEncontrado == 0){
                  $cursoEncontrado = 1;
                  $cursoAux= $curso;
                  next;
                }
              }
              if($cursoEncontrado == 0){
                print "Curso não encontrado. Inserir um curso válido.";
              }
            }
            $aluno = Aluno->new($nome,$email,$RA,$cursoAux);
            push(@alunos, $aluno);
            print("Aluno adicionado com sucesso\n");
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when (2){
            print("Digite o nome do aluno que deseja alterar o cadastro: ");
            $nomeAlterar = <STDIN>;
            print("\n");
            $alunoEncontrado = 0;
            $index = 0;
            foreach $aluno (@alunos){
              if (($aluno->{nome} eq $nomeAlterar) && $alunoEncontrado == 0){
                $alunoEncontrado = 1;
                delete $alunos[$index];
                print ("Digite o nome do aluno: ");
                $nome = <STDIN>;
                print("\nDigite o email do aluno: ");
                $email = <STDIN>;
                print("\nDigite o rendimento academico do aluno: ");
                $RA = <STDIN>;
                $cursoEncontrado = 0;
                while($cursoEncontrado == 0){
                  print ("\nDigite o Nome do Curso: ");
                  $nomeCurso = <STDIN>;
                  foreach $curso (@cursos){
                    if (($curso->{nome} eq $nomeCurso) && $cursoEncontrado == 0){
                      $cursoEncontrado = 1;
                      $cursoAux= $curso;
                      next;
                    }
                  }
                  if($cursoEncontrado == 0){
                    print "Curso não encontrado. Inserir um curso válido.";
                  }
                }
                $aluno = Aluno->new($nome,$email,$RA,$cursoAux);
                push(@alunos, $aluno);
                print("Aluno alterado com sucesso\n");
              }
              $index++;
            }
            if ($alunoEncontrado == 0){
              print("Aluno não cadastrado!\n");
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when (3){
            print("Digite o nome do aluno que deseja remover o cadastro: ");
            $nomeRemover = <STDIN>;
            print("\n");
            $alunoEncontrado = 0;
            $index = 0;
            foreach $aluno (@alunos){
              if (($aluno->{nome} eq $nomeAlterar) && $alunoEncontrado == 0){
                $alunoEncontrado = 1;
                delete $alunos[$index];
                print("Cadastro do aluno removido com sucesso\n");
              }
              $index++;
            }
            if ($alunoEncontrado == 0){
              print("Aluno não cadastrado!\n");
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(4){
            if(scalar(@alunos) == 0){
              print("Nenhum aluno cadastrado");
            }else{
              foreach $aluno (@alunos) {
                $aluno->printar($aluno);
              }
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when (0){
            next;
            system("clear");
          }
          default{
            print "Operacao invalida";
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
        }
      }
      system("clear");
    }
    #CURSOS
    when (2){
      $menuControleCursos = 1;
      while ($menuControleCursos != 0){
        print("Menu de Controle de Cursos \n");
        print("1- Adiconar Curso\n","2- Alterar Curso\n","3- Remover Curso\n","4- Visualizar Cursos Cadastradas\n","0- Voltar\n");
        print("Digite a opcao desejada\n");
        $menuControleCursos = <STDIN>;
        system("clear");
        given($menuControleCursos){
          when(1){
            my %grade;
            print ("Digite o Nome do Curso: ");
            $nome = <STDIN>;
            print ("\nDigite o Código do Curso: ");
            $codigo = <STDIN>;
            print("\nDigite a duracao do Curso (Em semestre): ");
            $duracao = <STDIN>;
            #GRADE CURRICULAR
            print("Deseja adicionar alguma disciplina ao curso? s/n ");
            $add = <STDIN>;
            chomp $add;
            if($add eq "s"){
              foreach $disciplina (@disciplinas){
                print("\nDeseja adicionar a disciplina ",$disciplina->{nome}, "? s/n ");
                $add = <STDIN>;
                chomp $add;
                if($add eq "s"){
                  print("\nDigite o semestre desejado: ");
                  $semestre = <STDIN>;
                  chomp $semestre;
                  $grade{$semestre} = $disciplina;
                  print("\nDisciplina adicionada com sucesso!\n");
                }
              }
            }
            $curso = Curso->new($nome,$codigo,$duracao);
            $matriz{$curso->{nome}} = \%grade;
            push(@cursos, $curso);
            print("Curso cadastrado com sucesso!\n");
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(2){
              my %grade;
              print("Digite o Nome do Curso a ser alterado: ");
              $cursoAlterado = <STDIN>;
              $cursoEncontrado = 0;
              foreach $curso (@cursos){
                  if (($curso->{nome} eq $$cursoAlterado) && $cursoEncontrado == 0){
                      $cursoEncontrado = 1;
                      print ("Digite o Nome do Curso: ");
                      $nome = <STDIN>;
                      print ("\nDigite o Código do Curso: ");
                      $codigo = <STDIN>;
                      print("\nDigite a duracao do Curso (Em semestre): ");
                      $duracao = <STDIN>;
                      #GRADE CURRICULAR
                      print("Deseja adicionar alguma disciplina ao curso? s/n ");
                      $add = <STDIN>;
                      chomp $add;
                      if($add eq "s"){
                          foreach $disciplina (@disciplinas){
                              print("\nDeseja adicionar a disciplina ",$disciplina->{nome}, "? s/n ");
                              $add = <STDIN>;
                              chomp $add;
                              if($add eq "s"){
                                  print("\nDigite o semestre desejado: ");
                                  $semestre = <STDIN>;
                                  chomp $semestre;
                                  $grade{$semestre} = $disciplina;
                                  print("\nDisciplina adicionada com sucesso!\n");
                              }
                          }

                      }
                      $curso = Curso->new($nome,$codigo,$duracao);
                      $matriz{$curso->{nome}} = \%grade;
                      push(@cursos, $curso);
                  }
              }
              if ($cursoEncontrado == 0){
                print("Curso não cadastrado!\n");
              }
              print("Aperte enter");
              $enter = <STDIN>;
              system("clear");

          }
          when(3){
              print("Digite o nome do Curso que deseja remover o cadastro: ");
              $codigoRemover = <STDIN>;
              print("\n");
              $cursoEncontrado = 0;
              $index = 0;
              foreach $curso (@cursos){
                if (($curso->{nome} eq $codigoRemover) && $cursoEncontrado == 0){
                  $cursoEncontrado = 1;
                  delete $cursos[$index];
                  print("Cadastro do curso removido com sucesso\n");
                }
                $index++;
              }
              if ($cursoEncontrado == 0){
                print("Curso não cadastrado!\n");
              }
              print("Aperte enter");
              $enter = <STDIN>;
              system("clear");

          }
          when(4){
            if(scalar(@cursos) == 0){
              print("Nenhum curso cadastrado");
            }else{
              foreach $curso (@cursos) {
                $curso->printar($curso);
                print("Semestres / Disciplinas: \n");
                foreach $chave (keys ($matriz{$curso->{nome}})) {
                  print ($chave," - ",$matriz{$curso->{nome}}{$chave}->{nome});
                }
              }
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(0){
            next;
            system("clear");
          }
          default{
            print "Operacao invalida";
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
        }
      }
    }
    #DISCIPLINAS
    when (3){
      $menuControleDisciplina = 1;
      while ($menuControleDisciplina != 0 ){
        print("Menu de Controle de Disciplinas \n");
        print("1- Adiconar Disciplina\n","2- Alterar Disciplina\n","3- Remover Disciplina\n","4- Visualizar Disciplinas Cadastradas\n","0- Voltar\n");
        print("Digite a opcao desejada\n");
        $menuControleDisciplina = <STDIN>;
        system("clear");
        given($menuControleDisciplina){
          when(1){
            print ("Digite o Nome da disciplina: ");
            $nome = <STDIN>;
            print ("\nDigite o Código da disciplina: ");
            $codigo = <STDIN>;
            print("\nDigite a Carga Horária da disciplina: ");
            $carga = <STDIN>;
            print("\nDigite o Valor da disciplina: ");
            $valor = <STDIN>;
            $disciplina = Disciplina->new($nome,$codigo,$carga,$valor);
            push(@disciplinas, $disciplina);
            print("Disciplina adicionada com sucesso\n");
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(2){
            print("Digite o codigo da disciplina que deseja alterar o cadastro: ");
            $codigoAlterar = <STDIN>;
            print("\n");
            $disciplinaEncontrada = 0;
            $index = 0;
            foreach $disciplina (@disciplinas){
              if (($disciplina->{codigo} eq $codigoAlterar) && $disciplinaEncontrada == 0){
                $disciplinaEncontrada = 1;
                delete $disciplinas[$index];
                print ("Digite o nome da disciplina: ");
                $nome = <STDIN>;
                print("\nDigite o codigo da disciplina: ");
                $codigo = <STDIN>;
                print("\nDigite a Carga Horaria da disciplina: ");
                $carga = <STDIN>;
                print("\nDigite o o valor da disciplina: ");
                $valor = <STDIN>;
                $disciplina = Disciplina->new($nome,$codigo,$carga,$valor);
                push(@disciplinas, $disciplina);
                print("Disciplina alterada com sucesso\n");
              }
              $index++;
            }
            if ($disciplinaEncontrada == 0){
              print("Disciplina não cadastrada!\n");
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(3){
            print("Digite o codigo da disciplina que deseja remover o cadastro: ");
            $codigoRemover = <STDIN>;
            print("\n");
            $disciplinaEncontrada = 0;
            $index = 0;
            foreach $disciplina (@disciplinas){
              if (($disciplina->{codigo} eq $codigoRemover) && $disciplinaEncontrada == 0){
                $disciplinaEncontrada = 1;
                delete $disciplinas[$index];
                print("Cadastro da disciplina removido com sucesso\n");
              }
              $index++;
            }
            if ($disciplinaEncontrada == 0){
              print("Disciplina não cadastrada!\n");
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(4){
            if(scalar(@disciplinas) == 0){
              print("Nenhuma disciplina cadastrado");
            }else{
              foreach $disciplina (@disciplinas) {
                $disciplina->printar($disciplina);
              }
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(0){
            next;
            system("clear");
          }
          default{
            print "Operacao invalida";
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
        }
      }
    }
    #MATRICULAS
    when (4){
      $menuControleMatricula = 1;
      while ($menuControleMatricula != 0 ){
        print("Menu de Controle de Disciplinas \n");
        print("1- Adiconar Matricula\n","2- Alterar Matricula\n","3- Remover Matricula\n","4- Visualizar Matriculas Cadastradas\n","0- Voltar\n");
        print("Digite a opcao desejada\n");
        $menuControleMatricula = <STDIN>;
        system("clear");
        given($menuControleMatricula){
          when(1){
            print ("Digite o Numero da Matricula: ");
            $numero = <STDIN>;
            $alunoEncontrado = 0;
            while($alunoEncontrado == 0){
              print ("\nDigite o Nome do Aluno: ");
              $nome = <STDIN>;
              foreach $aluno (@alunos){
                if (($aluno->{nome} eq $nome) && $alunoEncontrado == 0){
                  $alunoEncontrado = 1;
                  $alunoAux = $aluno;
                  next;
                }
              }
              if($alunoEncontrado == 0){
                print "Aluno não encontrado. Inserir um aluno válido.";
              }
            }
            print("\nDigite o Periodo do Aluno: ");
            $periodo = <STDIN>;
            chomp $period$matriz{$alunoAux->{curso}}{$periodo}->{valor};
            $valorTotal = $matriz{$alunoAux->{curso}->{nome}}{$periodo}->{valor};
            $matricula = Matricula->new($numero,$alunoAux,$periodo,$valorTotal);
            push(@matriculas,$matricula);
            print("Matrícula adicionada com sucesso\n");
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when (2){
              print("Digite o numero da matricula que deseja alterar o cadastro: ");
              $numeroAlterar = <STDIN>;
              print("\n");
              $matriculaEncontrada = 0;
              $index = 0;
              foreach $matricula (@matriculas){
                if (($matricula->{numero} eq $numeroAlterar) && $matriculaEncontrada == 0){
                  $matriculaEncontrada = 1;
                  delete $matriculas[$index];
                  print ("Digite o Numero da Matricula: ");
                  $numero = <STDIN>;
                  $alunoEncontrado = 0;
                  while($alunoEncontrado == 0){
                    print ("\nDigite o Nome do Aluno: ");
                    $nome = <STDIN>;
                    foreach $aluno (@alunos){
                      if (($aluno->{nome} eq $nome) && $alunoEncontrado == 0){
                        $alunoEncontrado = 1;
                        $alunoAux = $aluno;
                        next;
                      }
                    }
                    if($alunoEncontrado == 0){
                      print "Aluno não encontrado. Inserir um aluno válido.";
                    }
                  }

                  print("\nDigite o Periodo do Aluno: ");
                  $periodo = <STDIN>;
                  chomp $periodo;
                  $matricula = Matricula->new($numero,$alunoAux,$periodo,$matriz{$alunoAux->{curso}}{$periodo}->{valor});
                  push(@matriculas,$matricula);
                  print("Matrícula adicionada com sucesso\n");

              }
              $index++;
            }
            if($matriculaEncontrada == 0){
                print("Matricula nao cadastrada!\n");
            }
            print("Aperte enter");
            $enter = <STDIN>;
            system("clear");
          }
          when(3){
              print("Digite o numero da matricula que deseja remover o cadastro: ");
              $numeroRemover = <STDIN>;
              print("\n");
              $matriculaEncontrada = 0;
              $index = 0;
              foreach $matricula (@matriculas){
                if (($matricula->{numero} eq $numeroRemover) && $matriculaEncontrada == 0){
                  $matriculaEncontrada = 1;
                  delete $matriculas[$index];
                  print("Cadastro da matricula removido com sucesso\n");
                }
                $index++;
              }
              if ($matriculaEncontrada == 0){
                print("Matricula não cadastrada!\n");
              }
              print("Aperte enter");
              $enter = <STDIN>;
              system("clear");
          }
          when(4){
              if(scalar(@matriculas) == 0){
                print("Nenhuma matricula cadastrada");
              }else{
                foreach $matricula (@matriculas) {
                  $matricula->printar($matricula);
                }
              }
              print("Aperte enter");
              $enter = <STDIN>;
              system("clear");
          }
          when(0){
              next;
              system("clear");
          }
          default{
              print "Operacao invalida";
              print("Aperte enter");
              $enter = <STDIN>;
              system("clear");
          }
        }
      }
    }
    #SAIR
    when (0){
      next;
    }
    default {
      print("Operacao invalida\n");
    }
  }
}
