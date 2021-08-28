import 'package:get/get.dart';

class BrowseController extends GetxController {
  int _selected = 0;

  int get selected => _selected;

  set selected(int value) {
    _selected = value;
    update();
  }

  int _timeSelected = 1;

  int get timeSelected => _timeSelected;

  set timeSelected(int value) {
    _timeSelected = value;
    update();
  }

  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    update();
  }
}
