import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/menuController.dart';
import 'package:whatscooking/ui/screens/drawerMenu/profile.dart';
import 'package:whatscooking/ui/screens/drawerMenu/weeklyreport.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'bookdiary.dart';
import 'browse.dart';
import 'myPrefrences.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

// class Menu extends StatelessWidget {
//   const Menu({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: Get.width,
//         height: Get.height,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AppImages.menuBackground),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: DrawerMenuList());
//   }
// }
//
class DrawerMenuList extends StatelessWidget {
  final MenuController menuController = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        list.length,
        (index) => GetBuilder(
          builder: (MenuController controller) => GestureDetector(
            onTap: () {
              if (index != 0) {
                controller.isSelected = index;
              }

              if (index == 1)
                Get.to(() => Browse());
              else if (index == 2)
                Get.to(() => BookDiary());
              else if (index == 3)
                Get.to(() => WeeklyReport());
              else if (index == 4)
                Get.to(() => MyPreferences());
              else if (index == 5) Get.to(() => MyProfile());
            },
            child: FittedBox(
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    list[index].widget,
                    index == 0 ? SizedBox() : getHeightSizedBox(w: 10),
                    Text(
                      list[index].title,
                      style: index == 0
                          ? TextStyle(
                              fontSize: getWidth(25),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline)
                          : TextStyle(
                              fontSize: getWidth(16),
                              fontWeight: FontWeight.w600,
                            ),
                    ),
                    getHeightSizedBox(w: kDefaultPadding),
                    index == 0
                        ? SizedBox(
                            width: 3,
                          )
                        : controller.isSelected == index
                            ? Container(
                                width: 3,
                                height: 17,
                                decoration: BoxDecoration(
                                  color: AppColor.kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 3,
                              ),
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
  MenuListModel(title: 'More', widget: SizedBox()),
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
