import 'dart:ffi';

import 'package:introducao_a_testes/classes/viacep.dart';
import 'package:introducao_a_testes/introducao_a_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'introducao_a_testes_test.mocks.dart';


@GenerateMocks([MockViaCEP])
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

  test('Retorna CEP', () async {
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.retornaCEP("01001000"))
      .thenAnswer((realInvocation) => Future.value({
        "cep": "01001-000",
        "logradouro": "Praça da Sé",
        "complemento": "lado ímpar",
        "bairro": "Sé",
        "localidade": "São Paulo",
        "uf": "SP",
        "ibge": "3550308",
        "gia": "1004",
        "ddd": "11",
        "siafi": "7107"
      }));

    var body = await mockMockViaCEP.retornaCEP("01001000");
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });  

}

class MockViaCEP extends Mock implements ViaCEP{
  
}
