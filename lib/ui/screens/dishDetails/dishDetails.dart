import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customButton.dart';

import '../../../globals.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.access_time),
                      Text(
                        '30m',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: getWidth(15)),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
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
                              fontWeight: FontWeight.bold,
                              fontSize: getWidth(34)),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                dishDetailList.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    Get.to(() => Ingredients(index: index));
                                  },
                                  child: Text(
                                    dishDetailList[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffA6A6A6),
                                        fontSize: getWidth(26)),
                                  ),
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
