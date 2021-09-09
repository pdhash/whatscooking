import 'package:get/get.dart';

class BaseScreenController extends GetxController {
  int _selectedIndex = 2;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }

  late int _lastSelected;

  int get lastSelected => _lastSelected;

  set lastSelected(int value) {
    _lastSelected = value;
    update();
  }

  bool _isDialogueShow = true;

  bool get isDialogueShow => _isDialogueShow;

  set isDialogueShow(bool value) {
    _isDialogueShow = value;
    update();
  }
}
