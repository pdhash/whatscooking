import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _otpFieldShow = false;

  bool get otpFieldShow => _otpFieldShow;

  set otpFieldShow(bool value) {
    _otpFieldShow = value;
    update();
  }
}
