import 'package:intl/intl.dart';

extension TmDoubleExtension on double {
  String toCurrency() {
		return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(this);
  }
}
