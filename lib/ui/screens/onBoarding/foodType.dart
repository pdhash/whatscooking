import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/utils/lang.dart';
import 'package:whatscooking/ui/screens/onBoarding/timeOfDay.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

class FoodType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 0,
      // ),
      //extendBodyBehindAppBar: true,
      body: SetBackGround(
        image: AppImages.onBoardingBackGround,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Text(
                OnBoarding1Text.onBoardingTitle,
                style: TextStyle(
                  fontSize: getWidth(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            getHeightSizedBox(h: 24),
            CustomButton(
                text: OnBoarding1Text.button1,
                onTap: () {
                  Get.to(() => TimeOfDai());
                }),
            getHeightSizedBox(h: 12),
            CustomButton(
                text: OnBoarding1Text.button2,
                onTap: () {
                  Get.to(() => TimeOfDai());
                }),
            getHeightSizedBox(h: 12),
            CustomButton(
                text: OnBoarding1Text.button3,
                onTap: () {
                  Get.to(() => TimeOfDai());
                }),
            getHeightSizedBox(h: 12),
            Spacer(),
            SafeArea(
              child: Text(
                OnBoarding1Text.bottomText,
                style: TextStyle(fontSize: getWidth(12)),
              ),
            ),
            getHeightSizedBox(h: 10),
          ],
        ),
      ),
    );
  }
}
