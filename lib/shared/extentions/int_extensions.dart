import 'package:intl/intl.dart';

extension IntExtensions on int {
  String formatBudgetNumber() {
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return numberFormat.format(this);
  }
}
