import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/screens/notification/notificationScreen.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customTextfield.dart';

class AddDiary extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        appBarActionButtonType: AppBarActionButtonType.notification,
        appBarLeadingButtonType: AppBarLeadingButtonType.back,
        onLeadingButtonTap: () => Get.back(),
        onActionButtonTap: () => Get.to(() => Notifications()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                Text(
                  'Add',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                ),
                Spacer(),
                CustomTextField2(
                  controller: search,
                  width: getWidth(190),
                  height: 40,
                  hintText: 'Search',
                  prefixWidget: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          getHeightSizedBox(h: 25),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  addPost(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container addPost() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: getWidth(540),
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.background), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7, right: 20),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.loveCart),
            ),
          ),
          Spacer(),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(23),
                    bottomRight: Radius.circular(23))),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Text(
                'Egg Omlet',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
