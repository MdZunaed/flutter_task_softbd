import 'package:get/get.dart';

class DateController extends GetxController {
  var selectedDate = DateTime.now();
  var dates = <DateTime>[];

  @override
  void onInit() {
    super.onInit();
    generateDateRange();
  }

  void generateDateRange() {
    List<DateTime> tempDates = [];
    for (int i = -7; i <= 7; i++) {
      tempDates.add(selectedDate.add(Duration(days: i)));
    }
    dates = tempDates;
  }

  void updateSelectedDate(DateTime date) {
    selectedDate = date;
    generateDateRange();
    update();
  }
}
