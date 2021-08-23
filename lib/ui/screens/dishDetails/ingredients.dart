import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customButton.dart';

class Ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.like,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () => Get.back()),
      extendBodyBehindAppBar: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onBoardingBackGround),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: CustomButton(
                text: 'Yes, Im making this!',
                onTap: () {},
                color: AppColor.kPrimaryColor.withOpacity(0.65),
                height: 60,
                width: 233,
                radius: 60,
              ),
            ),
            Flexible(
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                maxChildSize: 1,
                minChildSize: 1,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      color: AppColor.kScaffoldColor,
                      child: Column(
                        children: [
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                          Text(
                            'ok',
                            style: TextStyle(fontSize: 70),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
