import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/recController.dart';
import 'package:whatscooking/ui/screens/dishDetails/dishDetails.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/customDialog.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

class Recommendations extends StatefulWidget {
  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      showCustomDialog(context: context);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final RecController recController = Get.put(RecController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (RecController controller) {
      return controller.isSpin
          ? SpinScreen()
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Aaj Kya Banaye?',
                      onTap: () {},
                      radius: 50,
                      height: 35,
                      width: 160,
                      fontSize: 14,
                    ),
                    getHeightSizedBox(h: 9),
                    Column(
                      children: List.generate(
                          3,
                          (index) => recFoodBox(
                              image: AppImages.recFoodBoxPhoto,
                              title: 'Butter Paneer')),
                    ),
                    getHeightSizedBox(h: 9),
                    GestureDetector(
                      onTap: () {
                        controller.isSpin = true;
                      },
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5,
                        children: [
                          buildSvgImage(
                              image: AppIcons.wheel, height: 40, width: 40),
                          Text(
                            'Help me choose',
                            style: TextStyle(
                                color: AppColor.kPrimaryColor,
                                fontSize: getWidth(15),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    getHeightSizedBox(h: 25)
                  ],
                ),
              ),
            );
    });
  }
}

class SpinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (RecController controller) {
        return SingleChildScrollView(
          controller: ScrollController(initialScrollOffset: 0),
          child: Column(
            children: [
              getHeightSizedBox(h: 10),
              Text(
                'Spin the wheel to get your recommendation',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: getWidth(25)),
              ),
              // Container(
              //   height: 500,
              //     child: FortuneWheel(
              //       selected: Stream.value(0),
              //       // physics: PanPhysics(),
              //       duration: Duration(seconds: 5),
              //       items: [
              //         FortuneItem(
              //           child: Text('A'),
              //           // style: FortuneItemStyle(
              //           //   color: Colors.red,
              //           //   borderColor: Colors.green,
              //           //   borderWidth: 3,
              //           // ),
              //         ),
              //         FortuneItem(child: Text('B')),
              //         FortuneItem(child: Text('B')),
              //       ],
              //     ),
              // ),
              CustomButton(
                  text: 'Spin',
                  onTap: () {
                    Get.to(() => DishDetails());
                    controller.isSpin = false;
                  })
            ],
          ),
        );
      },
    );
  }
}

Widget recFoodBox(
    {required String image,
    Function()? onTap,
    required String title,
    bool isNotWeight = false}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: Container(
        height: 165,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: isNotWeight ? 40 : 50,
          width: Get.width,
          color: Colors.black.withOpacity(0.20),
          child: Center(
            child: Row(
              children: [
                getHeightSizedBox(w: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: isNotWeight ? null : FontWeight.bold,
                    fontSize: getWidth(isNotWeight ? 20 : 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
