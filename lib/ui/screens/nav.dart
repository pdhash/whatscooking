import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/ui/shared/imagePicker.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

class BottomBar extends StatefulWidget {
  final BaseScreenController homeController = Get.put(BaseScreenController());
  final ImagePickerController imagePickerController =
      Get.find<ImagePickerController>();

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'image': AppIcons.home,
        'height': 21.0,
        'width': 20.0,
      },
      {
        'image': AppIcons.shoppingList,
        'height': 18.0,
        'width': 21.0,
      },
      {
        'image': AppIcons.shoppingList,
        'height': 18.0,
        'width': 21.0,
      },
      {
        'image': AppIcons.calendar,
        'height': 22.0,
        'width': 24.0,
      },
      {
        'image': AppIcons.menu,
        'height': 18.0,
        'width': 27.0,
      },
    ];
    return GetBuilder(
      builder: (BaseScreenController controller) => Container(
        color: Colors.black,
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.black,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      list.length,
                      (index) => IconButton(
                            onPressed: () {
                              widget.imagePickerController.reset();
                              controller.selectedIndex = index;
                              print(controller.selectedIndex);
                            },
                            icon: buildSvgImage(
                              image: list[index]['image'],
                              height: list[index]['height'],
                              width: list[index]['width'],
                              color: controller.selectedIndex == index
                                  ? AppColor.kPrimaryColor
                                  : null,
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
                    controller.selectedIndex = 2;
                    print('call');
                    print(controller.selectedIndex);
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: buildSvgImage(
                          image: AppIcons.spinWheel, height: 40, width: 40),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
