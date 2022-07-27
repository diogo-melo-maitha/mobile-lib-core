import 'package:intl/intl.dart';

extension TmDoubleExtension on double {
  String toCurrency() {
    final numberFormat = NumberFormat('#,###.00', 'pt_BR');
    return 'R\$${numberFormat.format(this)}';
  }
}
