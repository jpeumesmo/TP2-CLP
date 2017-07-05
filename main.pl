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

%alunos;
%cursos;
%disciplinas;
%matriculas;

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
                print("1- Adiconar Aluno\n","2- Alterar Aluno\n","3- Remover Aluno\n","4- Visualizar Alunos\n","0 - Voltar\n");
                print("Digite a opcao desejada\n");
                $menuControleAluno = <STDIN>;

                given($menuControleAluno){
                    when (1){
                        $aluno = Aluno->new("joao","jasda","asdas","asd");
                        $alunos{$aluno->{nome}} =  $aluno;
                    }
                    when (2){

                    }
                    when (3){

                    }
                    when(4){
                        foreach $aluno (%alunos) {
                            print ($aluno);
                            $aluno{}->printar($aluno);
                        }
                        #system("clear");
                    }
                    when (0){
                        next;
                    }
                    default{
                        print "Operacao invalida";
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
