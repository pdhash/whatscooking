import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/ui/shared/imagePicker.dart';

final AppImagePicker appImagePicker = AppImagePicker();
void showMessage(String msg) {
  Get.snackbar(msg, "", snackPosition: SnackPosition.BOTTOM);
}

List<Map<String, dynamic>> weeklyScreenList = [
  {'title': 'Calories', 'color': Color(0xffFFAA00)},
  {'title': 'Protein', 'color': Color(0xffFF5042)},
  {'title': 'Carbs', 'color': Color(0xff00DAFD)},
];
List browsList1 = ['Breakfast', 'Lunch', 'Dinner'];
List browsList2 = ['10 min', '30 min', '1 hour'];
