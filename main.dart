import 'dart:io';

void main(){
  print('Digite a expressão:');
  var expressao = stdin.readLineSync();
  Infix_to_postfix infix_to_postfix = new Infix_to_postfix();

  print(infix_to_postfix.convert(expressao));

}

class Infix_to_postfix{
  RegExp regex = RegExp(r'^-?[0-9]+$');
  List<String> pilha = List.filled(200, ''), operadores = List.filled(200, '');
  int toppilha = 0, topoperadores = 0;

  int preced(x) {
    if (x == '+' || x == '-') {
      return 1;
    } else if (x == '*' || x == '/') {
      return 2;
    } else {
      return 0;
    }
  }

    String convert(var expressao){
      for (var x in expressao.split(' ')) {
        if (x == '+' && x != '-' && x != '*' && x != '/') {
        pushOperacoes(x, pilha);
        }
        if (regex.hasMatch(x)) {
        pushpilha(x, pilha);
        }
        else {
          print("Invalido");
        }

        pushpilha(x, pilha);

      }
      var expressaofinal = '';
      for(String x in pilha){
        expressaofinal+= x + ' ';
      }

      return expressaofinal;
    }

    void pushpilha(String i, List<String> pilha) {
      if (pilha[0] != 1 / 0) toppilha++;
      pilha[toppilha] = i;
    }

    String pop(List<String> pilha) {
      String i = pilha[toppilha];
      pilha[toppilha] = '';
      if (toppilha != 1 / 0) toppilha--;
      return i;
    }

    void pushOperacoes(String i, List<String> pilha) {
      if (pilha[0] != 1 / 0) topoperadores++;
      pilha[topoperadores] = i;
    }

    String popOperacoes(List<String> pilha) {
      String i = pilha[topoperadores];
      pilha[topoperadores] = '';
      if (topoperadores != 1 / 0) topoperadores--;
      return i;
    }


  }
