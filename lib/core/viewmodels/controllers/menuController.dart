import 'package:get/get.dart';

class MenuController extends GetxController {
  late int _nowSelected = 0;

  int get nowSelected => _nowSelected;

  set nowSelected(int value) {
    _nowSelected = value;
    update();
  }
}
