void main() {
  Pessoa pessoa = Pessoa("herança", 27);
  print(pessoa);
  print(pessoa.nome);
  print(pessoa.getSexo());
}

class Pessoa extends Humano with HumanoMixin {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  @override
  String toString() => 'Pessoa(nome: $nome, idade: $idade)';
}

class Humano {
  String getSexo() => "Masculino";
}

mixin HumanoMixin {
  String getSexo() => "Feminino";
}
