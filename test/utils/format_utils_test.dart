import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/format_utils.dart';

void main() {
  group('FormatUtils tests', () {
    test('removeSpecialCharacters correctly removes special chars', () {
      const text = '%¨¨Hello#@- World';

      expect('Hello World', FormatUtils.removeSpecialCharacters(text));
    });

    test('isPasswordValid is properly validating passwords', () {
      var password = 'Aaaa@2';

      expect(true, FormatUtils.isPasswordValid(password));

      password = 'aaaa@2';

      expect(false, FormatUtils.isPasswordValid(password));

      password = 'Aaaaa@';

      expect(false, FormatUtils.isPasswordValid(password));

      password = 'Aaaaa2';

      expect(false, FormatUtils.isPasswordValid(password));

      password = 'Aaa@2';

      expect(false, FormatUtils.isPasswordValid(password));

      password = '';

      expect(false, FormatUtils.isPasswordValid(password));
    });

    test('isEmailValid is properly validating emails', () {
      var email = 'email@email.com';

      expect(true, FormatUtils.isEmailValid(email));

      email = 'email@asa';

      expect(false, FormatUtils.isEmailValid(email));

      email = '';

      expect(false, FormatUtils.isEmailValid(email));
    });

    test('maskDocument correctly mask string', () {
      var text = '79185944017';

      expect('791.859.440-17', FormatUtils.maskDocument(text));

      text = '26666877000100';

      expect('26.666.877/0001-00', FormatUtils.maskDocument(text));

      text = 'shouldReturnText';

      expect(text, FormatUtils.maskDocument(text));
    });

    test('maskPhoneNumber correctly mask string', () {
      var text = '11923151707';

      expect('(11) 92315 1707', FormatUtils.maskPhoneNumber(text));

      text = '1145151775';

      expect('(11) 4515 1775', FormatUtils.maskPhoneNumber(text));

      text = 'shouldReturnText';

      expect(text, FormatUtils.maskPhoneNumber(text));
    });

    test('maskPostalCode correctly mask string', () {
      var text = '09360220';

      expect('09360-220', FormatUtils.maskPostalCode(text));

      text = 'shouldReturnText';

      expect(text, FormatUtils.maskPostalCode(text));
    });

    test('isCPFValid is properly validating cpfs', () {
      var cpf = '21219641006';
      expect(FormatUtils.isCPFValid(cpf), true);

      cpf = '17734532493';
      expect(FormatUtils.isCPFValid(cpf), false);

      cpf = '503.100.700-15';
      expect(FormatUtils.isCPFValid(cpf), true);

      cpf = '177.345.324-93';
      expect(FormatUtils.isCPFValid(cpf), false);
    });

    test('isCNPJValid is properly validating cnpjs', () {
      var cnpj = '92881156000147';
      expect(FormatUtils.isCNPJValid(cnpj), true);

      cnpj = '92881156000141';
      expect(FormatUtils.isCNPJValid(cnpj), false);

      cnpj = '92.881.156/0001-47';
      expect(FormatUtils.isCNPJValid(cnpj), true);

      cnpj = '92.881.156/0001-41';
      expect(FormatUtils.isCNPJValid(cnpj), false);
    });
  });
}
