import 'package:get/get.dart';

class BaseScreenController extends GetxController {
  int _selectedIndex = 2;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }
}
