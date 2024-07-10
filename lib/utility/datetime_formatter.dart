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
    1: 'রবিবার',
    2: 'সোমবার',
    3: 'মঙ্গলবার',
    4: 'বুধবার',
    5: 'বৃহস্পতিবার',
    6: 'শুক্রবার',
    7: 'শনিবার',
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
}
