import 'package:get/get.dart';

class FilterController extends GetxController {
  int _currentFilter = 0;

  int get currentFilter => _currentFilter;

  set currentFilter(int value) {
    _currentFilter = value;
    update();
  }
}
