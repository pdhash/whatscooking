import 'package:get/get.dart';

class DishDetailController extends GetxController {
  bool _isCheck = false;

  bool get isCheck => _isCheck;

  set isCheck(bool value) {
    _isCheck = value;
    update();
  }

  bool _isCheckBox = false;

  bool get isCheckBox => _isCheckBox;

  set isCheckBox(bool value) {
    _isCheckBox = value;
    update();
  }

  int _isSelected = 0;

  int get isSelected => _isSelected;

  set isSelected(int value) {
    _isSelected = value;
    update();
  }

  ///---------------------------------
  double _isShow = 0;

  double get isShow => _isShow;

  set isShow(double value) {
    _isShow = value;
    update();
  }
}
