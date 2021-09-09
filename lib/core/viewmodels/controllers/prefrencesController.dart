import 'package:get/get.dart';

class MyPreferencesController extends GetxController {
  List cuisinesList = [];

  add(index) {
    cuisinesList.add(index);
    update();
  }

  remove(index) {
    cuisinesList.remove(index);
    update();
  }

  List healthList = [];

  addH(index) {
    healthList.add(index);
    update();
  }

  removeH(index) {
    healthList.remove(index);
    update();
  }

  List familyHealthList = [];

  addHF(index) {
    familyHealthList.add(index);
    update();
  }

  removeHf(index) {
    familyHealthList.remove(index);
    update();
  }
}
