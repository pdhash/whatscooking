import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/core/viewmodels/controllers/recController.dart';
import 'package:whatscooking/ui/screens/dishDetails/dishDetails.dart';
import 'package:whatscooking/ui/screens/login/login.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'filterScreen.dart';

class Recommendations extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Recommendations> {
  final BaseScreenController baseScreenController =
      Get.find<BaseScreenController>();

  final RecController recController = Get.put(RecController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            getHeightSizedBox(h: 10),
            filterHeader(),
            getHeightSizedBox(h: 9),
            Column(
              children: List.generate(
                  3,
                  (index) => recFoodBox(
                      onTap: () {
                        Get.to(() => DishDetails());
                      },
                      image: AppImages.recFoodBoxPhoto,
                      title: 'Butter Paneer')),
            ),
            getHeightSizedBox(h: 9),
            GestureDetector(
              onTap: () {
                recController.isSpin = true;
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  buildSvgImage(image: AppIcons.wheel, height: 40, width: 40),
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
  }

  Widget filterHeader() {
    return Row(
      children: [
        Spacer(
          flex: 6,
        ),
        CustomButton(
          text: 'Aaj Kya Banaye?',
          onTap: () {
            Get.to(() => Login());
          },
          radius: 50,
          height: 35,
          width: 160,
          fontSize: 14,
        ),
        Spacer(
          flex: 2,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => FilterScreen());
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(5),
            child: Center(child: SvgPicture.asset(AppIcons.filter)),
          ),
        ),
        getHeightSizedBox(w: kDefaultPadding)
      ],
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
