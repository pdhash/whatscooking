import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whatscooking/ui/screens/Recommendations/recommendation.dart';
import 'package:whatscooking/ui/screens/drawerMenu/menu.dart';
import 'package:whatscooking/ui/screens/feed/feed.dart';
import 'package:whatscooking/ui/screens/mealPlan/calendar.dart';
import 'package:whatscooking/ui/screens/shoppingList/shoppingList.dart';
import 'package:whatscooking/ui/shared/imagePicker.dart';

late final AppImagePicker appImagePicker;

initialiseGlobalVars() {
  appImagePicker = AppImagePicker();
}

String dateNameConverter(DateTime? date) {
  return DateFormat("MMMM d").format(date!);
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
const List weightList = ['100', '200', '500'];

final List<Widget> navigationList = [
  Feed(),
  ShoppingList(),
  Recommendations(),
  MealPlan(),
  Menu(),
];
const List<Map<String, dynamic>> list = [
  {'title': 'Every 2 days', 'number': 2},
  {'title': 'Weekly', 'number': 7},
  {'title': 'Every 15 days', 'number': 15}
];

///----------------------temporary
List recImageList = [
  'assets/images/recImage/WhatsApp Image 2021-09-05 at 01.51.42.png',
  'assets/images/recImage/3251e50aa4225c4d7e7693f7e42b7f54.png',
  'assets/images/recImage/front-view-pizza-with-red-tomatoes-cheese-brown-wooden-round-desk-grey-floor.png'
];
List recTextList = ['Chole Bhature', 'Masala Dabeli', 'Pizza'];
