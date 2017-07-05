package Matricula;

sub new{
    my $class = shift;
    my $numero = shift;
    my $aluno = shift;
    my $periodo = shift;

    my $self = {};

    $self->{numero} = $numero;
    $self->{aluno} = $aluno;
    $self->{periodo} = $periodo;

    bless($self,$class);

    return $self;
}


sub printar{
    my $self = shift;
    print("MATRICULA\n","Numero: ",$self->{numero},"\n","Periodo: ",$self->{periodo},"\n","Aluno: ",$self->{aluno},"\n\n");
    return;
}

1;
