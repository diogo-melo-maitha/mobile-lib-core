import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/format_utils.dart';

void main() {
  group('FormatUtils tests', () {
    test('removeSpecialCharacters correctly removes special chars', () {
      const text = '%¨¨Hello#@- World';

      expect('Hello World', FormatUtils.removeSpecialCharacters(text));
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
      var text = '40540788816';

      expect('405.407.888-16', FormatUtils.maskDocument(text));

      text = '40540788816242';

      expect('40.540.788/8162-42', FormatUtils.maskDocument(text));

      text = 'shouldReturnText';

      expect(text, FormatUtils.maskDocument(text));
    });

    test('maskPhoneNumber correctly mask string', () {
      var text = '11953171707';

      expect('(11) 95317 1707', FormatUtils.maskPhoneNumber(text));

      text = '1145161776';

      expect('(11) 4516 1776', FormatUtils.maskPhoneNumber(text));

      text = 'shouldReturnText';

      expect(text, FormatUtils.maskPhoneNumber(text));
    });

    test('maskPostalCode correctly mask string', () {
      var text = '09360220';

      expect('09360-220', FormatUtils.maskPostalCode(text));

      text = 'shouldReturnText';

      expect(text, FormatUtils.maskPostalCode(text));
    });
  });
}
