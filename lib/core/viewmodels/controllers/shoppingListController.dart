import 'package:get/get.dart';

class ShoppingListController extends GetxController {
  bool _isEmpty = true;

  bool get isEmpty => _isEmpty;

  set isEmpty(bool value) {
    _isEmpty = value;
    update();
  }
}
