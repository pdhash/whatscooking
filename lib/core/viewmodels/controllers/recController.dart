import 'package:get/get.dart';

class RecController extends GetxController {
  bool _isSpin = false;

  bool get isSpin => _isSpin;

  set isSpin(bool value) {
    _isSpin = value;
    update();
  }

  bool _isAnimating = false;

  bool get isAnimating => _isAnimating;

  set isAnimating(bool value) {
    _isAnimating = value;
    update();
  }
}
