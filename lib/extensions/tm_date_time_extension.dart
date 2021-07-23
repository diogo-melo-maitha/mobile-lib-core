import 'package:intl/intl.dart';

extension TmDateTimeExtension on DateTime {
  String toMonthYearFormat() {
    final DateFormat formatter = DateFormat('MM/yyyy');
    return formatter.format(this);
  }

  String toDayMonthFormat() {
    final DateFormat formatter = DateFormat('dd/MM');
    return formatter.format(this);
  }

  String toDefaultFormat() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }

  String toDefaultFormatWithTime() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy - HH:mm');
    return formatter.format(this);
  }
}
