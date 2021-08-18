import 'package:flutter_test/flutter_test.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';

void main() {
  group('CNPJValidator tests', () {
    test('isValid correctly verify if cnpj is valid without punctuation when its valid', () {
      const cnpj = '92881156000147';

      expect(CNPJValidator.isValid(cnpj), true);
    });
    test('isValid correctly verify if cnpj is valid without punctuation when its invalid', () {
      const cnpj = '92881156000141';

      expect(CNPJValidator.isValid(cnpj), false);
    });

    test('isValid correctly verify if cnpj is valid with punctuation when its valid', () {
      const cnpj = '92.881.156/0001-47';

      expect(CNPJValidator.isValid(cnpj), true);
    });
    test('isValid correctly verify if cnpj is valid with punctuation when its invalid', () {
      const cnpj = '92.881.156/0001-41';

      expect(CNPJValidator.isValid(cnpj), false);
    });

    test('generate correctly generates valid cnpjs', () {
      final cnpj = CNPJValidator.generate();
      // print(cnpj);

      expect(CNPJValidator.isValid(cnpj), true);
    });

    test('strip correctly remove special characters', () {
      const cnpj = '92.881.156/0001-47';

      expect('92881156000147', CNPJValidator.strip(cnpj));
    });

    test('format correctly apply the cnpj format', () {
      const cnpj = '92881156000147';

      expect('92.881.156/0001-47', CNPJValidator.format(cnpj));
    });
  });
}
