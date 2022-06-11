import 'package:intl/intl.dart';

class Helpers {
  static String formatCurrency({required dynamic nominal, String locale = 'id_ID', String symbol = "Rp "}) {
    return NumberFormat.currency(locale: locale, symbol: symbol, decimalDigits: 0).format(nominal);
  }
}
