import 'package:flutter/material.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';

import 'appColors.dart';

class AppTheme {
  static final ThemeData defTheme = ThemeData(
    //visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColor.kScaffoldColor,
    primaryIconTheme: IconThemeData(color: Colors.white),
    fontFamily: kAppFont, iconTheme: IconThemeData(color: Colors.white),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      brightness: Brightness.dark,
      centerTitle: true,
      actionsIconTheme: IconThemeData(size: 16, color: Colors.white),
    ),
    textTheme: TextTheme(
        bodyText2:
            TextStyle(color: AppColor.kTextColor, fontSize: getWidth(16))),
  );
}
