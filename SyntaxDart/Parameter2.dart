void main() {
  PrintText(num: 5, text: "Nome de variavel");
}

void PrintText({required String text, required int num}) {
  print("O texto é: $text\nO numero é: $num");
}
