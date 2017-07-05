use Data::Dumper;
package Curso;

sub new{
    my $class = shift;
    my $nome = shift;
    my $codigo = shift;
    my $duracao = shift;
    my %grade = shift;

    my $self = {};

    bless($self,$class);

    $self->{nome} = $nome;
    $self->{codigo} = $codigo;
    $self->{duracao} = $duracao;

    $self->{grade} = %grade;
    print("as ",%grade,);

    return $self;

}

sub printar{
    my $self = shift;
    print("CURSO\n","Nome: ",$self->{nome},"\n","Codigo: ",$self->{codigo},"\n","Duracao: ",$self->{duracao},"\n");

#    print("teste ",$self->{grade});
#    while ( my ($key, $value) = each($self->{grade}) ) {
#           print "$value->{nome}\n";
#    }

#    say qq{@{ [ values $self->{grade} ] }};
#    print("teste", %{$self->{grade}});
#    print @{[\$self->{grade}]};
    #print ($self->{grade}{$_});
#    foreach $grade ($self->{grade}){
#        print ($self->{grade}{$semestre});
#    }
    return;
}

1;
