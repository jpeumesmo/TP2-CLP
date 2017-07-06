package Aluno ;

sub new{
    my $class = shift;
    my $nome = shift;
    my $email = shift;
    my $RA = shift;
    my $curso = shift;

    my $self = {};

    bless($self, $class);

    $self->{nome} = $nome;
    $self->{email} = $email;
    $self->{RA} = $RA;
    $self->{curso} = $curso;

    return $self;
}

sub printar{
    my $self = shift;
    print("ALUNO\n","Nome: ",$self->{nome},"Email: ",$self->{email},"Rendimento do Aluno: ",$self->{RA},"Curso: ",$self->{curso}->{nome},"\n");
    return;
}

1;
