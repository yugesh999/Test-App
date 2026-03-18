import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatNumber() {
    NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");
    return numberFormat.format(this);
  }

  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
