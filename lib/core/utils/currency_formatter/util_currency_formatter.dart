import 'package:intl/intl.dart';

class UtilCurrencyFormatter {
  static String format(double value) {
    final formatter = NumberFormat.simpleCurrency();
    return formatter.format(value);
  }
}
