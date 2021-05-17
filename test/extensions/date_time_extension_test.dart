import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/extensions/date_time_extension.dart';

void main() {
  /// 17/05/2021 11:01:34
  const epochTime = 1621260094;

  group('DateTimeExtensions tests', () {
    test('toMonthYearFormat correctly formats date', () {
      final date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
      final formatted = date.toMonthYearFormat();

      expect(formatted, '05/2021');
    });

    test('toDayMonthFormat correctly formats date', () {
      final date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
      final formatted = date.toDayMonthFormat();

      expect(formatted, '17/05');
    });

    test('toDefaultFormat correctly formats date', () {
      final date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
      final formatted = date.toDefaultFormat();

      expect(formatted, '17/05/2021');
    });

    test('toDefaultFormat correctly formats date', () {
      final date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
      final formatted = date.toDefaultFormatWithTime();

      expect(formatted, '17/05/2021 - 11:01');
    });
  });
}
