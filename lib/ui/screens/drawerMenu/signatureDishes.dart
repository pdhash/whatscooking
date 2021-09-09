import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/ui/screens/drawerMenu/browse.dart';
import 'package:whatscooking/ui/screens/notification/notificationScreen.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

class SignatureDishes extends StatelessWidget {
  final BaseScreenController baseScreenController =
      Get.put(BaseScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onActionButtonTap: () => Get.to(() => Notifications()),
          onLeadingButtonTap: () => Get.back()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.85),
          itemCount: 6,
          itemBuilder: (context, index) => GestureDetector(
            onTap: index == 5
                ? () {
                    // Get.back();
                    // Get.back();
                    Get.to(() => Browse());
                  }
                : null,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                image: index == 5
                    ? null
                    : DecorationImage(
                        image: AssetImage(AppImages.background),
                        fit: BoxFit.cover),
                color: Color(0xff707070),
              ),
              child: index == 5
                  ? Center(child: SvgPicture.asset(AppIcons.plus))
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
