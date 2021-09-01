import 'package:get/get.dart';

class MealPlanController extends GetxController {
  List list = ['Every 2 days', 'Weekly', 'Every 15 days'];
  int _isSelected = 1;

  int get isSelected => _isSelected;

  set isSelected(int value) {
    _isSelected = value;
    update();
  }
}
