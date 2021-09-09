import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/utils/lang.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import '../baseScreen.dart';

class TimeOfDai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetBackGround(
        image: AppImages.onBoardingBackGround,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Text(
                OnBoarding2Text.onBoardingTitle,
                style: TextStyle(
                  fontSize: getWidth(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            getHeightSizedBox(h: 24),
            CustomButton(
                text: OnBoarding2Text.button1,
                onTap: () {
                  Get.offAll(() => BaseScreen());
                }),
            getHeightSizedBox(h: 12),
            CustomButton(
                text: OnBoarding2Text.button2,
                onTap: () {
                  Get.offAll(() => BaseScreen());
                }),
            getHeightSizedBox(h: 12),
            CustomButton(
                text: OnBoarding2Text.button3,
                onTap: () {
                  Get.offAll(() => BaseScreen());
                }),
            getHeightSizedBox(h: 12),
            Spacer(),
            SafeArea(
              child: Text(
                '',
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
