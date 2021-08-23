import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customButton.dart';

import 'ingredients.dart';

class DishDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        appBarActionButtonType: AppBarActionButtonType.like,
        appBarLeadingButtonType: AppBarLeadingButtonType.back,
        onLeadingButtonTap: () => Get.back(),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.onBoardingBackGround),
                  fit: BoxFit.cover)),
          alignment: Alignment.bottomCenter,
          child: FittedBox(
            child: Container(
              //height: 250,
              width: Get.width,
              decoration: BoxDecoration(color: Colors.black26),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7, horizontal: kDefaultPadding - 5),
                    child: Text(
                      'Mughle Shahi Butter Paneer Masala',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: getWidth(34)),
                    ),
                  ),
                  Container(
                    height: 180, width: Get.width,

                    decoration: BoxDecoration(
                        color: AppColor.kScaffoldColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Column(
                      children: [
                        Spacer(
                          flex: 3,
                        ),
                        CustomButton(
                          text: 'Yes, Im making this!',
                          onTap: () {},
                          radius: 50,
                          height: 60,
                          width: 233,
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Ingredients());
                          },
                          child: Text(
                            'Ingredients       Recipe',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffA6A6A6),
                                fontSize: getWidth(26)),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    //  color: AppColor.kScaffoldColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// SafeArea(
// bottom: false,
// child: Stack(
// children: [
// Positioned(
// bottom: 130,
// child: Container(
// height: 130,
// width: Get.width,
// padding:
// EdgeInsets.symmetric(horizontal: kDefaultPadding - 10)
// .copyWith(top: 10),
// color: Colors.black26,
// child: Text(
// 'Mughle Shahi Butter Paneer Masala',
// style: TextStyle(
// fontWeight: FontWeight.bold, fontSize: getWidth(34)),
// ),
// ),
// ),
// Positioned(
// bottom: 0,
// child: Container(
// height: getHeight(200),
// width: Get.width,
// decoration: BoxDecoration(
// color: AppColor.kScaffoldColor,
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(40),
// topLeft: Radius.circular(40))),
// ),
// ),
// ],
// ),
// )
