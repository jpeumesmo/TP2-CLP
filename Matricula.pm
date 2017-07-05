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

1;
