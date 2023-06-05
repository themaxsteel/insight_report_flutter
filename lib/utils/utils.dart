import 'package:intl/intl.dart';

class Utils {
  static String convertMoney(num number, {int? decimalDigits, bool useNegative = false}) {
    try {
      if (number.isNegative && useNegative == false) {
        number = number.abs();
        return "(${NumberFormat.currency(symbol: '', decimalDigits: decimalDigits).format(number)})";
      }
      return NumberFormat.currency(symbol: '', decimalDigits: decimalDigits, locale: "ID_id").format(number);
    } catch (e) {
      return 'error';
    }
  }

  static String compactCurrency(num number, {int? decimalDigits}) {
    return NumberFormat.compactCurrency(symbol: '', decimalDigits: decimalDigits, locale: "ID_id").format(number);
  }

  static String clock24h(DateTime dateTime) {
    return DateFormat("HH:mm").format(dateTime);
  }
}
