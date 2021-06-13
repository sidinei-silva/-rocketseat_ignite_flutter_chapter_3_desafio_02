import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class FormatHelper {
  static String formatCurrency(double value) {
    return new NumberFormat.simpleCurrency(
      locale: "pt_BR",
    ).format(value).replaceAll('-', '');
  }

  static String formatDateToDayAndMonthExtensive(DateTime date) {
    initializeDateFormatting('pt_BR', null);
    return new DateFormat.MMMMd('pt_BR').format(date);
  }
}
