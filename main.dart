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

  bool preced(var x, var y) {
    if ((x=='*' || x=='/') && (y=='*' || y=='/'|| y=='+')||y=='-' ) {
      return true;
    } else {
      return false;
    }
  }

  String convert(var expressao){
    for (var x in expressao.split(' ')) {
      if (x == '+' || x == '-' || x == '*' || x == '/' || x == '(') {
        if (preced(x, operadores[topoperadores])) {
          pushOperacoes(x, operadores);
        } else {
          if (toppilha > 0) pushpilha(popOperacoes(operadores), pilha);
          pushOperacoes(x, operadores);
        }

      } else {
        if (x == ')') {
          String i = '';
          while (i != '(') {
            i = operadores[topoperadores];
            if (i == '(') {
              popOperacoes(operadores);
            }
            }

        }
          if(!regex.hasMatch(x)){
          print('Expressão invalida');
          exit(1);
        }

      }
      if(topoperadores>1){
        print('ERRO: OPERADOR A MENOS');
        exit(0);
      }
      if (topoperadores < 0) {
        print('ERRO: OPERADOR A MAIS');
        exit(0);
      }

      print(pilha);
      print(operadores);
      print(toppilha);
      print(topoperadores);
    }
    for(int i = topoperadores;i>=0;i--){
      pushpilha(popOperacoes(operadores), pilha);
    }

    var expressaofinal = '';
    for(String x in pilha){
      expressaofinal+= x + ' ';
    }
    return expressaofinal;
  }

  void pushpilha(String i, List<String> pilha) {
    if (pilha[0] != '' && pilha[toppilha]!='') toppilha++;
    pilha[toppilha] = i;
  }

  String pop(List<String> pilha) {
    String i = pilha[toppilha];
    pilha[toppilha] = '';
    if (toppilha > 0) toppilha--;
    return i;
  }

  void pushOperacoes(String i, List<String> pilha) {
    if (pilha[0] != '') topoperadores++;
    pilha[topoperadores] = i;
  }

  String popOperacoes(List<String> pilha) {
    String i = pilha[topoperadores];
    pilha[topoperadores] = '';
    if (topoperadores > 0) topoperadores--;
    return i;
  }


}