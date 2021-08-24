import 'package:get/get.dart';

class DishDetailController extends GetxController {
  bool _isCheck = false;

  bool get isCheck => _isCheck;

  set isCheck(bool value) {
    _isCheck = value;
    update();
  }

  int _isSelected = 0;

  int get isSelected => _isSelected;

  set isSelected(int value) {
    _isSelected = value;
    update();
  }
}
