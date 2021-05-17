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

      text = '1145561775';

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
  });
}
