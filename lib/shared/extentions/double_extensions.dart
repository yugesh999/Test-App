import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  String formatBudgetNumber() {
    NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");
    return numberFormat.format(this);
  }
}
