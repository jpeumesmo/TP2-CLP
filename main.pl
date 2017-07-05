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

$entre;
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
        when (1){
            $menuControleAluno = 1;
            while ($menuControleAluno != 0 ){
                print("Menu de Controle de Alunos \n");
                print("1- Adiconar Aluno\n","2- Alterar Aluno\n","3- Remover Aluno\n","4- Visualizar Alunos Cadastrados\n","0 - Voltar\n");
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
                        $entre = <STDIN>;
                        system("clear");
                    }
                    when (2){
                        print("Digite o nome do aluno que deseja alterar o cadastro: ");
                        $nomeAlterar = <STDIN>;
                        print("\n");
                        $alunoEcontrado = 0;
                        $index = 0;
                        foreach $aluno (@alunos){
                            if ($aluno->{nome} eq $nomeAlterar && $alunoEcontrado == 0){
                                $alunoEcontrado = 1;
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
                        if ($alunoEcontrado == 0){
                            print("Aluno não cadastrado!\n");
                        }
                        print("Aperte enter");
                        $entre = <STDIN>;
                        system("clear");
                    }
                    when (3){
                        print("Digite o nome do aluno que deseja remover o cadastro: ");
                        $nomeRemover = <STDIN>;
                        print("\n");
                        $alunoEcontrado = 0;
                        $index = 0;
                        foreach $aluno (@alunos){
                            if ($aluno->{nome} eq $nomeAlterar && $alunoEcontrado == 0){
                                $alunoEcontrado = 1;
                                delete $alunos[$index];
                                print("Cadastro do aluno removido com sucesso");
                            }
                        }
                        if ($alunoEcontrado == 0){
                            print("Aluno não cadastrado!\n");
                        }
                        print("Aperte enter");
                        $entre = <STDIN>;
                        system("clear");
                    }
                    when(4){
                        foreach $aluno (@alunos) {
                            $aluno->printar($aluno);
                        }
                        print("Aperte enter");
                        $entre = <STDIN>;
                        system("clear");
                    }
                    when (0){
                        next;
                        system("clear");
                    }
                    default{
                        print "Operacao invalida";
                        print("Aperte enter");
                        $entre = <STDIN>;
                        system("clear");
                    }
                }
            }
            system("clear");
        }
        when (2){

        }
        when (3){

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
