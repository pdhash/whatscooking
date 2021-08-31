import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/screens/menu/myPrefrences.dart';

import 'customButton.dart';

enum DialogueType { preferenceFillUp, rewardInfo }
Future showCustomDialog(
    {required BuildContext context,
    double? height,
    String? title,
    required DialogueType dialogueType}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white24,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
        insetAnimationCurve: Curves.bounceIn,
        child: FittedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(33),
            child: Container(
              width: Get.width,
              color: dialogueType == DialogueType.preferenceFillUp
                  ? AppColor.kScaffoldColor
                  : Colors.white,
              child: dialogueType == DialogueType.preferenceFillUp
                  ? Column(
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
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
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
                    )
                  : Column(
                      children: [
                        getHeightSizedBox(h: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              color: Colors.black,
                              iconSize: 30,
                              icon: Icon(Icons.close),
                            ),
                          ),
                        ),
                        getHeightSizedBox(h: 30),
                        Text(
                          'Master of Cultures',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: getWidth(25)),
                        ),
                        getHeightSizedBox(h: 40),
                        SvgPicture.asset(AppIcons.kingHead),
                        getHeightSizedBox(h: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'You receive this Achievement when you prepare meals from 10 different cultural origins',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getWidth(18),
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        getHeightSizedBox(h: 70),
                      ],
                    ),
            ),
          ),
        ),
      );
    },
  );
}
