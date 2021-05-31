import 'package:intl/intl.dart';

class FormatHelper {
  static String formatCurrency(double value) {
    return new NumberFormat.simpleCurrency(
      locale: "pt_BR",
    ).format(value);
  }
}
