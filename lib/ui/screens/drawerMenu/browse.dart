import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/appFunctions.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/browseController.dart';
import 'package:whatscooking/ui/screens/mealPlan/calendar.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

import '../../../globals.dart';

class Browse extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  final BrowseController browseController = Get.put(BrowseController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        appBar: appBar(
            onLeadingButtonTap: () {
              Get.back();
            },
            appBarLeadingButtonType: AppBarLeadingButtonType.back,
            appBarActionButtonType: AppBarActionButtonType.notification),
        body: Column(
          children: [
            getHeightSizedBox(h: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: [
                  Text(
                    'Browse',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                  ),
                  Spacer(),
                  CustomTextField2(
                    controller: search,
                    width: 145,
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
            buildRow1(),
            getHeightSizedBox(h: 20),
            buildRow2(),
            getHeightSizedBox(h: 20),
            pageViews()
          ],
        ),
      ),
    );
  }

  Widget pageViews() {
    return GetBuilder(builder: (BrowseController controller) {
      PageController pageController = PageController();
      return Expanded(
        child: PageView(
          controller: pageController,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: WeeklyPlan(
                  onCircleTap: () {
                    pageController.animateToPage(2,
                        duration: Duration(microseconds: 1),
                        curve: Curves.easeOut);
                  },
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  children: List.generate(
                    4,
                    (index) => Container(
                      height: getWidth(500),
                      width: Get.width,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(AppImages.background),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(23)),
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, right: 20),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcons.loveCart),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildRow2() {
    return GetBuilder(
      builder: (BrowseController controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            browsList2.length,
            (index) => GestureDetector(
              onTap: () {
                disposeKeyboard();
                controller.timeSelected = index;
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.access_time,
                    color: index == controller.timeSelected
                        ? AppColor.kPrimaryColor
                        : Colors.white,
                  ),
                  getHeightSizedBox(w: 5),
                  Text(
                    browsList2[index],
                    style: TextStyle(
                        fontSize: getWidth(18),
                        color: index == controller.timeSelected
                            ? AppColor.kPrimaryColor
                            : Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow1() {
    return GetBuilder(
      builder: (BrowseController controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: List.generate(
              browsList1.length,
              (index) => Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        disposeKeyboard();
                        controller.selected = index;
                      },
                      child: Text(
                        browsList1[index],
                        style: TextStyle(
                            fontSize: getWidth(18),
                            color: index == controller.selected
                                ? AppColor.kPrimaryColor
                                : Colors.white),
                      ),
                    )),
                    decoration: BoxDecoration(
                        border: index == 2
                            ? Border()
                            : Border(
                                right:
                                    BorderSide(color: Colors.white, width: 1))),
                  ))),
        ),
      ),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? textInputType;
  final double width;
  final double height;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool giveSpace;
  final int? length;
  final int? minLines;
  final int? maxLines;
  final Widget? suffix;

  const CustomTextField2(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.textInputType,
      this.width = 0,
      this.height = 50,
      this.prefixWidget,
      this.suffixWidget,
      this.giveSpace = false,
      this.length,
      this.minLines,
      this.maxLines,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == 50 ? 50 : height,
      width: width == 0 ? Get.width : width,
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          style: TextStyle(color: Colors.white),
          textCapitalization: TextCapitalization.sentences,
          maxLength: length,
          maxLines: maxLines,
          minLines: minLines,
          buildCounter: (BuildContext context,
                  {required int currentLength,
                  required bool isFocused,
                  required int? maxLength}) =>
              null,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white54),
              prefixIconConstraints:
                  giveSpace ? null : BoxConstraints.tight(Size.fromRadius(15)),
              suffixIconConstraints:
                  giveSpace ? null : BoxConstraints.tight(Size.fromRadius(15)),
              prefixIcon: prefixWidget,
              suffix: suffix,
              suffixIcon: suffixWidget),
        ),
      ),
    );
  }
}
