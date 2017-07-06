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
  return $self;
}
sub printar{
  my $self = shift;
  print("CURSO\n","Nome: ",$self->{nome},"Codigo: ",$self->{codigo},"Duracao (em semestres): ",$self->{duracao});

  return;
}
1;
