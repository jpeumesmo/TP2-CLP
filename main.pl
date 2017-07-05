use feature 'switch';
no if $] >= 5.018, warnings => qw( experimental::smartmatch );


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
                        print("\nDigite o curso do aluno: ");
                        $curso = <STDIN>;
                        $aluno = Aluno->new($nome,$email,$RA,$curso);
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
                                print("\nDigite o curso do aluno: ");
                                $curso = <STDIN>;
                                $aluno = Aluno->new($nome,$email,$RA,$curso);
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
                        print ("\nDigite o Código da disciplina");
                        $codigo = <STDIN>;
                        print("\nDigite a Carga Horária da disciplina");
                        $carga = <STDIN>;
                        print("\nDigite o Valor da disciplina");
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
        when (4){

        }
        when (0){
            next;
        }
        default {
            print("Operacao invalida\n");
        }
    }
}
