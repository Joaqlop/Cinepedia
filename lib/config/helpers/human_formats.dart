import 'package:intl/intl.dart';

class HumanFormats {
  static String popularity(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);
    return formattedNumber;
  }

  static String today(DateTime today) {
    final formattedToday = DateFormat.MMMMEEEEd().format(today);
    return formattedToday;
  }

  static String thisMonth(DateTime month) {
    final formattedMonth = DateFormat.MMMM().format(month);
    return formattedMonth;
  }
}
