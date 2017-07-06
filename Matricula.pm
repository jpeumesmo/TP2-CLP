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
    print("MATRICULA\n","Numero: ",$self->{numero},"Periodo: ",$self->{periodo},"Aluno: ",$self->{aluno},"\n");
    return;
}

1;
