package Disciplina;

sub new{
    my $class = shift;
    my $nome = shift;
    my $codigo = shift;
    my $cargaHoraria = shift;
    my $valor = shift;

    my $self = {};

    $self->{nome} = $nome;
    $self->{codigo} = $codigo;
    $self->{cargaHoraria} = $cargaHoraria;
    $self->{valor} = $valor;

    bless($self,$class);

    return $self;
}

sub printar{
    my $self = shift;
    print("DISCIPLINA\n","Nome: ",$self->{nome},"Codigo: ",$self->{codigo},"Carga Horaria: ",$self->{cargaHoraria},"Valor: ",$self->{valor},"\n");
    return;
}

1;
