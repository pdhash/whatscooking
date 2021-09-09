import 'package:get/get.dart';

class ShoppingListController extends GetxController {
  bool _isEmpty = true;

  bool get isEmpty => _isEmpty;

  set isEmpty(bool value) {
    _isEmpty = value;
    update();
  }

  int _currentWeight = 1;

  int get currentWeight => _currentWeight;

  set currentWeight(int value) {
    _currentWeight = value;
    update();
  }
}
