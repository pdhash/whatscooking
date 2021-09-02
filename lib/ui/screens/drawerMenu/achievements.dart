import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customDialog.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () {
            Get.back();
          }),
      body: Column(
        children: [
          getHeightSizedBox(h: 15),
          Text(
            'Achievements',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(26)),
          ),
          getHeightSizedBox(h: 25),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: kDefaultPadding),
              itemCount: 15,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: GestureDetector(
                  onTap: () {
                    showCustomDialog(
                        context: context,
                        dialogueType: DialogueType.rewardInfo);
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Spacer(
                              flex: 2,
                            ),
                            SvgPicture.asset(AppIcons.kingHead),
                            Spacer(),
                            Text(
                              'Master of Cuisines',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kPrimaryColor,
                                  fontSize: getWidth(12)),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black38,
                        child: Center(child: SvgPicture.asset(AppIcons.lock)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          getHeightSizedBox(h: 25),
        ],
      ),
    );
  }
}
