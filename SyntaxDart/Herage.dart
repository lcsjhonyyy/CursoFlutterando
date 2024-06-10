main () {
    Pessoa pessoa = Pessoa ("herança", 27);
    print(pessoa);
    print(pessoa.nome);
    print(pessoa.Getsexo());
}

class Pessoa extends Humano with HumanoMixin
String none;
int idade;
Pessoa(this.nome, this.idade);
}
//herança
Class Humano {
    Strinf GetSexo () => "Masculino";
}
class HumanoMixin {
    Strinf GetSexo() => "Feminino";
}
