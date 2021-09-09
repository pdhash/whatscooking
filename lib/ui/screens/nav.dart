import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/globals.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'drawerMenu/menu.dart';

class BottomBar extends StatefulWidget {
  final BaseScreenController homeController = Get.put(BaseScreenController());

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'image': AppIcons.home,
        'title': 'Home',
        'height': 21.0,
        'width': 20.0,
      },
      {
        'image': AppIcons.shoppingList,
        'title': 'Shopping List',
        'height': 18.0,
        'width': 21.0,
      },
      {
        'image': AppIcons.shoppingList,
        'title': 'Recommendations',
        'height': 18.0,
        'width': 21.0,
      },
      {
        'image': AppIcons.calendar,
        'title': 'Meal Plan',
        'height': 22.0,
        'width': 24.0,
      },
      {
        'image': AppIcons.menu,
        'title': 'More',
        'height': 18.0,
        'width': 27.0,
      },
    ];
    return GetBuilder(
      builder: (BaseScreenController controller) => Container(
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.black,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      list.length,
                      (index) => GestureDetector(
                            onTap: () {
                              controller.lastSelected =
                                  controller.selectedIndex;
                              if (index == 4) {
                                showBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(39),
                                        topRight: Radius.circular(39)),
                                  ),
                                  builder: (context) => Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                          width: Get.width,
                                          height: Get.height,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(39),
                                                topRight: Radius.circular(39)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  AppImages.menuBackground),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: DrawerMenuList()),
                                      Container(
                                        height: 5,
                                        width: 75,
                                        margin: EdgeInsets.only(
                                            top: kDefaultPadding),
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFFFFF).withOpacity(0.78),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      )
                                    ],
                                  ),
                                ).closed.then((value) => controller
                                    .selectedIndex = controller.lastSelected);
                              } else {
                                Get.back();
                                controller.lastSelected = index;
                              }
                              controller.selectedIndex = index;
                              appImagePicker.imagePickerController.reset();
                            },
                            child: Container(
                              color: index == 2 ? null : Colors.transparent,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: index == 2
                                        ? getWidth(100)
                                        : getWidth(60),
                                    // color:
                                    //     index == 2 ? Colors.red : Colors.yellow,
                                    height: 30,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        list[index]['image'],
                                        color: controller.selectedIndex == index
                                            ? index == 2
                                                ? Colors.transparent
                                                : AppColor.kPrimaryColor
                                            : null,
                                      ),
                                    ),
                                  ),
                                  getHeightSizedBox(h: 2),
                                  Text(
                                    list[index]['title'],
                                    style: TextStyle(
                                        fontSize: getWidth(9.4),
                                        color: controller.selectedIndex == index
                                            ? AppColor.kPrimaryColor
                                            : Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
              Positioned(
                top: -15,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                    if (controller.lastSelected == 4) {
                      controller.lastSelected = controller.selectedIndex;
                    } else {
                      controller.lastSelected = 2;
                    }

                    controller.selectedIndex = 2;
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: buildSvgImage(
                          image: AppIcons.spinWheel, height: 40, width: 40),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //     child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: List.generate(
              //       list.length,
              //       (index) => Text(
              //             list[index]['title'],
              //             style: TextStyle(fontSize: getWidth(12)),
              //           )),
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
