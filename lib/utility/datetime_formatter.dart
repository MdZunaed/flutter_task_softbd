class BengaliDateFormatter {
  static final Map<int, String> _bengaliMonths = {
    1: 'জানুয়ারী',
    2: 'ফেব্রুয়ারী',
    3: 'মার্চ',
    4: 'এপ্রিল',
    5: 'মে',
    6: 'জুন',
    7: 'জুলাই',
    8: 'আগস্ট',
    9: 'সেপ্টেম্বর',
    10: 'অক্টোবর',
    11: 'নভেম্বর',
    12: 'ডিসেম্বর',
  };
  static final Map<int, String> _bengaliWeekdays = {
    1: 'রবি',
    2: 'সোম',
    3: 'মঙ্গল',
    4: 'বুধ',
    5: 'বৃহ',
    6: 'শুক্র',
    7: 'শনি',
  };

  static final List<String> _bengaliNumbers = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];

  static String _convertToBengaliNumber(int number) {
    return number.toString().split('').map((char) => _bengaliNumbers[int.parse(char)]).join('');
  }

  static String format(DateTime date) {
    final day = _convertToBengaliNumber(date.day);
    final month = _bengaliMonths[date.month]!;
    final year = _convertToBengaliNumber(date.year);
    final weekday = _bengaliWeekdays[date.weekday]!;

    return '$day $month';
    //return '$weekday, $day $month $year';
  }

  static String formatDay(DateTime date) {
    final day = _convertToBengaliNumber(date.day);
    final weekday = _bengaliWeekdays[date.weekday]!;

    return '$weekday\n$day';
  }

  static String convertToBengali(String input) {
    const englishToBengaliDigits = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };

    String result = '';
    for (var char in input.split('')) {
      result += englishToBengaliDigits[char] ?? char;
    }
    return result;
  }

  static String getBengaliTimeOfDay(DateTime dateTime) {
    final hour = dateTime.hour;
    if (hour >= 0 && hour < 12) {
      return 'সকাল';
    } else if (hour >= 12 && hour < 17) {
      return 'দুপুর';
    } else if (hour >= 17 && hour < 20) {
      return 'বিকেল';
    } else {
      return 'রাত';
    }
  }
}
