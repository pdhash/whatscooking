import 'package:get/get.dart';

class MenuController extends GetxController {
  int _isSelected = 0;

  int get isSelected => _isSelected;

  set isSelected(int value) {
    _isSelected = value;
    update();
  }
}
