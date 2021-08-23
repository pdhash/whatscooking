import 'package:get/get.dart';

class RecController extends GetxController {
  bool _isSpin = false;

  bool get isSpin => _isSpin;

  set isSpin(bool value) {
    _isSpin = value;
    update();
  }
}
