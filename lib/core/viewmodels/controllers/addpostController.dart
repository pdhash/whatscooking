import 'package:get/get.dart';

class AddPostController extends GetxController {
  List list = ['Family', 'Public'];
  int _defaultSet = 0;

  int get defaultSet => _defaultSet;

  set defaultSet(int value) {
    _defaultSet = value;
    update();
  }
}
