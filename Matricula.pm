package Matricula;

sub new{
    my $class = shift;
    my $numero = shift;
    my $aluno = shift;
    my $periodo = shift;
    my $valor = shift;

    my $self = {};

    $self->{numero} = $numero;
    $self->{aluno} = $aluno;
    $self->{periodo} = $periodo;
    $self->{valor} = $valor;

    bless($self,$class);

    return $self;
}

sub printar{
    my $self = shift;
    print("MATRICULA\n","Numero: ",$self->{numero},"Periodo: ",$self->{periodo},"Aluno: ",$self->{aluno},"Valor Total: ",$self->{valor},"\n");
    return;
}

1;
