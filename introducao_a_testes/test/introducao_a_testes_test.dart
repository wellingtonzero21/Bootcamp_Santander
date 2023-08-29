import 'package:introducao_a_testes/introducao_a_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcular o valor do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test(
      'Calcular o valor do produto com desconto sem porcentagem passando o valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });


  group('Calcular valor do produto com desconto: ', () {
    var valuesToTest = {
      {"valor": 1000, "desconto": 150, "percentual": false}: 850,
      {"valor": 1000, "desconto": 15, "percentual": true}: 850,
    };

    valuesToTest.forEach((values, expected) {
      test('Entrada: $values: Esperado: $expected ', () {
        expect(
            app.calcularDesconto(
              double.parse(values["valor"].toString()), 
              double.parse(values["desconto"].toString()), 
              values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group('Calcular o valor do produto informando valores zerados, deve gerar erro', () {
    var valuesToTest = {
      {"valor": 0, "desconto": 150, "percentual": false},
      {"valor": 1000, "desconto": 0, "percentual": true},
    };

    for (var values in valuesToTest) { 
      test('Entrada: $values', () {
        expect(
          () => app.calcularDesconto(
            double.parse(values["valor"].toString()),
            double.parse(values["desconto"].toString()),
            values["percentual"] == true),
          throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('O texto esta em Caixa Alta', () {
    expect(app.convertToUper("dio"), equals("DIO"));
  });  

  test('O texto esta em Caixa Alta teste 2', () {
    expect(app.convertToUper("dio"), equalsIgnoringCase("dio"));
  });  
}
