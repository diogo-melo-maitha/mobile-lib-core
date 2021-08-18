import 'package:flutter_test/flutter_test.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

void main() {
  group('CPFValidator tests', () {
    test('isValid correctly verify if cpf is valid without punctuation when its valid', () {
      const cpf = '21219641006';

      expect(CPFValidator.isValid(cpf), true);
    });
    test('isValid correctly verify if cpf is valid without punctuation when its invalid', () {
      const cpf = '17734532493';

      expect(CPFValidator.isValid(cpf), false);
    });

    test('isValid correctly verify if cpf is valid with punctuation when its valid', () {
      const cpf = '503.100.700-15';

      expect(CPFValidator.isValid(cpf), true);
    });
    test('isValid correctly verify if cpf is valid with punctuation when its invalid', () {
      const cpf = '177.345.324-93';

      expect(CPFValidator.isValid(cpf), false);
    });

    test('generate correctly generates valid cpfs', () {
      final cpf = CPFValidator.generate();
      // print(cpf);

      expect(CPFValidator.isValid(cpf), true);
    });

    test('strip correctly remove special characters', () {
      const cpf = '503.100.700-15';

      expect('50310070015', CPFValidator.strip(cpf));
    });

    test('format correctly apply the cpf format', () {
      const cpf = '50310070015';

      expect('503.100.700-15', CPFValidator.format(cpf));
    });
  });
}
