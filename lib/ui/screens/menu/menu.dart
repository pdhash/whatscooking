import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/screens/menu/bookdiary.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'browse.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          getHeightSizedBox(h: 50),
          Expanded(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    image: DecorationImage(
                        image: AssetImage(AppImages.menuBackground),
                        fit: BoxFit.fitWidth)),
                child: MenuList()),
          )
        ],
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        getHeightSizedBox(h: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'More',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: getWidth(25),
                  decoration: TextDecoration.underline),
            ),
            getHeightSizedBox(w: 25),
            SizedBox(
              width: 3,
            )
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              list.length,
              (index) => GestureDetector(
                onTap: () {
                  if (index == 0)
                    Get.to(() => Browse());
                  else if (index == 1) Get.to(() => BookDiary());
                },
                child: Row(
                  children: [
                    Spacer(),
                    list[index].widget,
                    getHeightSizedBox(w: 10),
                    Text(
                      list[index].title,
                      style: TextStyle(fontSize: getWidth(16)),
                    ),
                    getHeightSizedBox(w: kDefaultPadding),
                    Container(
                      width: 3,
                      height: 17,
                      decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MenuListModel {
  final Widget widget;
  final String title;
  final Color? color;

  MenuListModel({this.color, required this.widget, required this.title});
}

List<MenuListModel> list = [
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.search, height: 13, width: 13),
      title: 'Browse'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.history, height: 13, width: 15),
      title: 'Cook Diary'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.history, height: 13, width: 15),
      title: 'Weekly Report'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.setting, height: 13, width: 13),
      title: 'My Preferences'),
  MenuListModel(
      widget: buildSvgImage(
        image: AppIcons.user,
        height: 15,
        width: 13,
      ),
      title: 'My Profile'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.signOut, height: 13, width: 16),
      title: 'Sign Out'),
];
