import 'package:intl/intl.dart';

class Helper {
  static String getPopularity(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);
    return formattedNumber;
  }

  static String getToday(DateTime today) {
    final formattedToday = DateFormat.MMMMd().format(today);
    return formattedToday;
  }

  static String getThisMonth(DateTime month) {
    final formattedMonth = DateFormat.MMMM().format(month);
    return formattedMonth;
  }

  static String getRelease(DateTime releaseData) {
    final formattedRelease = DateFormat.y().format(releaseData);
    return formattedRelease;
  }

  static String getMovieRuntime(int runtime) {
    String formattedRuntime = '';
    int hour = (runtime ~/ 60);
    int minute = (runtime % 60);

    if (hour == 0) {
      formattedRuntime = '${minute}min';
    } else if (minute == 0) {
      formattedRuntime = '${hour}h';
    } else {
      formattedRuntime = '${hour}h ${minute}min';
    }

    return formattedRuntime;
  }
}
