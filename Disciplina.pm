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
    print("DISCIPLINA\n","Nome: ",$self->{nome},"\n","Codigo: ",$self->{codigo},"\n","Carga Horaria: ",$self->{cargaHoraria}," horas,","\n","Valor: ",$self->{valor},"\n\n");
    return;
}
1;
