import 'package:get/get.dart';

class BookDiaryController extends GetxController {
  int _isSelected = 0;

  int get isSelected => _isSelected;

  set isSelected(int value) {
    _isSelected = value;
    update();
  }
}
