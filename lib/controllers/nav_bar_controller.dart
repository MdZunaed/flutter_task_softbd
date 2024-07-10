import 'package:get/get.dart';

class NavBarController extends GetxController {
  int currentIndex = 0;

  void changeScreen(int index) {
    currentIndex = index;
    update();
  }

  void backToHome() {
    currentIndex = 0;
    update();
  }
}
