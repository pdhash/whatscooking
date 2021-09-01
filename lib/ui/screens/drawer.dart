import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/screens/drawerMenu/bookdiary.dart';
import 'package:whatscooking/ui/screens/drawerMenu/browse.dart';
import 'package:whatscooking/ui/screens/drawerMenu/shoppingList.dart';
import 'package:whatscooking/ui/screens/drawerMenu/weeklyreport.dart';
import 'package:whatscooking/ui/screens/login/login.dart';
import 'package:whatscooking/ui/screens/profile/myPrefrences.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.74,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.loginBackground1), fit: BoxFit.fill),
        ),
        child: SafeArea(child: DrawerMenuList()));
  }
}

class DrawerMenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        list.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            onTap: () {
              Get.back();
              if (index == 1)
                Get.to(() => Browse());
              else if (index == 2)
                Get.to(() => BookDiary());
              else if (index == 3)
                Get.to(() => ShoppingList());
              else if (index == 4)
                Get.to(() => WeeklyReport());
              else if (index == 5)
                Get.to(() => MyPreferences());
              else if (index == 6) Get.offAll(() => Login());
            },
            child: FittedBox(
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    index == 0
                        ? SizedBox(
                            width: 3,
                          )
                        : Container(
                            width: 3,
                            height: 17,
                            decoration: BoxDecoration(
                              color: AppColor.kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                              ),
                            ),
                          ),
                    getHeightSizedBox(w: kDefaultPadding),
                    Text(
                      list[index].title,
                      style: index == 0
                          ? TextStyle(
                              fontSize: getWidth(25),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline)
                          : TextStyle(
                              fontSize: getWidth(16),
                              fontWeight: FontWeight.w600),
                    ),
                    getHeightSizedBox(w: 10),
                    list[index].widget,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
  MenuListModel(title: 'Menu', widget: SizedBox()),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.search, height: 13, width: 13),
      title: 'Browse'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.history, height: 13, width: 15),
      title: 'Cook Diary'),
  MenuListModel(
      widget: buildSvgImage(
        image: AppIcons.shoppingList,
        height: 15,
        width: 13,
      ),
      title: 'Shopping List'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.history, height: 13, width: 15),
      title: 'Weekly Report'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.setting, height: 13, width: 13),
      title: 'My Preferences'),
  MenuListModel(
      widget: buildSvgImage(image: AppIcons.signOut, height: 13, width: 16),
      title: 'Sign Out'),
];
