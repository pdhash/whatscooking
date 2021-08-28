import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/screens/menu/myPrefrences.dart';

import 'customButton.dart';

Future showCustomDialog({
  required BuildContext context,
  double? height,
  String? title,
  // required String content,
  // required double contentSize,
  // required Function()? onTap,
  // required Color color,
  // required String okText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white38,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding + 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
        insetAnimationCurve: Curves.bounceIn,
        child: FittedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(33),
            child: Container(
              width: Get.width,
              color: AppColor.kScaffoldColor,
              child: Column(
                children: [
                  getHeightSizedBox(h: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding + 10),
                    child: Column(
                      children: [
                        Text(
                          'Get more desirable recommendations',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getWidth(25)),
                        ),
                        getHeightSizedBox(h: 50),
                        Text(
                          'Help us understand your preferences, so we can suggest more relevant dishes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.4,
                            fontSize: getWidth(18),
                          ),
                        ),
                        getHeightSizedBox(h: 15),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              ':',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: SvgPicture.asset(AppIcons.smile),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  getHeightSizedBox(h: 25),
                  CustomButton(
                      text: 'Sure, I have 2 mins',
                      onTap: () {
                        Get.back();
                        Get.to(() => MyPreferences());
                      }),
                  getHeightSizedBox(h: 15),
                  CustomButton(
                      text: "I'll do it later",
                      onTap: () {
                        Get.back();
                      }),
                  getHeightSizedBox(h: 50),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
