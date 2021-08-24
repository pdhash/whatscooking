import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:whatscooking/core/constant/appThemes.dart';
import 'package:whatscooking/ui/screens/onBoarding/foodType.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "What's Cooking",
      debugShowCheckedModeBanner: false,
      home: FoodType(),
      theme: AppTheme.defTheme,
    );
  }
}
