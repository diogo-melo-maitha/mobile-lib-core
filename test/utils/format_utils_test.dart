import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/format_utils.dart';

void main() {
  group('FormatUtils tests', () {
    test('removeSpecialCharacters correctly removes special chars', () {
      const text = '%¨¨Hello#@- World';

      expect('Hello World', TmFormatUtils.removeSpecialCharacters(text));
    });

    test('isEmailValid is properly validating emails', () {
      var email = 'email@email.com';

      expect(true, TmFormatUtils.isEmailValid(email));

      email = 'email@asa';

      expect(false, TmFormatUtils.isEmailValid(email));

      email = '';

      expect(false, TmFormatUtils.isEmailValid(email));
    });

    test('maskDocument correctly mask string', () {
      var text = '79185944017';

      expect('791.859.440-17', TmFormatUtils.maskDocument(text));

      text = '26666877000100';

      expect('26.666.877/0001-00', TmFormatUtils.maskDocument(text));

      text = 'shouldReturnText';

      expect(text, TmFormatUtils.maskDocument(text));
    });

    test('maskPhoneNumber correctly mask string', () {
      var text = '11923151707';

      expect('(11) 92315 1707', TmFormatUtils.maskPhoneNumber(text));

      text = '1145151775';

      expect('(11) 4515 1775', TmFormatUtils.maskPhoneNumber(text));

      text = 'shouldReturnText';

      expect(text, TmFormatUtils.maskPhoneNumber(text));
    });

    test('maskPostalCode correctly mask string', () {
      var text = '09360220';

      expect('09360-220', TmFormatUtils.maskPostalCode(text));

      text = 'shouldReturnText';

      expect(text, TmFormatUtils.maskPostalCode(text));
    });
  });
}
