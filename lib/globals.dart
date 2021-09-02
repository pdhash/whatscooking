import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/ui/screens/Recommendations/recommendation.dart';
import 'package:whatscooking/ui/screens/drawerMenu/menu.dart';
import 'package:whatscooking/ui/screens/drawerMenu/shoppingList.dart';
import 'package:whatscooking/ui/screens/feed/feed.dart';
import 'package:whatscooking/ui/screens/mealPlan/calendar.dart';
import 'package:whatscooking/ui/shared/imagePicker.dart';

late final AppImagePicker appImagePicker;

initialiseGlobalVars() {
  appImagePicker = AppImagePicker();
}

void showMessage(String msg) {
  Get.snackbar(msg, "", snackPosition: SnackPosition.BOTTOM);
}

const List<Map<String, dynamic>> weeklyScreenList = [
  {'title': 'Calories', 'color': Color(0xffFFAA00)},
  {'title': 'Protein', 'color': Color(0xffFF5042)},
  {'title': 'Carbs', 'color': Color(0xff00DAFD)},
];
const List browsList1 = ['Breakfast', 'Lunch', 'Dinner'];
const List bookDiaryList = ['Cook Diary', 'Favourites'];
const List browsList2 = ['10 min', '30 min', '1 hour'];
const List dishDetailList = ['Ingredients', 'Recipe'];

final List<Widget> navigationList = [
  Feed(),
  ShoppingList(),
  Recommendations(),
  MealPlan(),
  Menu(),
];
