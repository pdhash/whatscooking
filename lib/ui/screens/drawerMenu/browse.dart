import 'dart:ui';

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
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/core/viewmodels/controllers/browseController.dart';
import 'package:whatscooking/core/viewmodels/controllers/mealPlanController.dart';
import 'package:whatscooking/ui/screens/notification/notificationScreen.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/customTextfield.dart';

import '../../../globals.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    // scrollController.jumpTo(scrollController.position.maxScrollExtent);
    super.initState();
  }

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
          appBarActionButtonType: AppBarActionButtonType.notification,
          onActionButtonTap: () => Get.to(() => Notifications()),
        ),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WeeklyPlan(),
                          getHeightSizedBox(w: 20),
                          SingleChildScrollView(child: BrowsePageView22())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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

class BrowsePageView22 extends StatelessWidget {
  const BrowsePageView22({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            4,
            (index) => Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding)
                          .copyWith(top: index == 0 ? 0 : 20),
                      height: getHeight(530),
                      width: getWidth(310),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.background),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, left: 20),
                                child: IconButton(
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset(AppIcons.kingHeadLittle),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, right: 20),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(AppIcons.loveCart),
                                ),
                              ),
                            ],
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
                    ),
                    index == 0 ? suggestionArrow() : SizedBox()
                  ],
                )),
      ),
    );
  }
}

class WeeklyPlan extends StatelessWidget {
  final MealPlanController mealPlanController = Get.find<MealPlanController>();
  final Function()? onCircleTap;
  final BaseScreenController baseScreenController =
      Get.find<BaseScreenController>();
  WeeklyPlan({Key? key, this.onCircleTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (MealPlanController controller) => Container(
        width: Get.width - 60,
        margin: EdgeInsets.only(left: kDefaultPadding),
        child: Center(
          child: Column(
            children: [
              Column(
                children: List.generate(
                  list[controller.isSelected]['number'],
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      children: [
                        Container(
                          height: getWidth(43),
                          width: getWidth(70),
                          decoration: BoxDecoration(
                              color: Color(0xff4A4A4A),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Day ${index + 1}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: getWidth(12)),
                            ),
                          ),
                        ),
                        getHeightSizedBox(w: 15),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              3,
                              (index) => GestureDetector(
                                onTap: onCircleTap,
                                child: Container(
                                  height: getWidth(70),
                                  width: getWidth(70),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      browsList1[index],
                                      style: TextStyle(
                                          fontSize: getWidth(12),
                                          color: Color(0xffAEAEAE),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              getHeightSizedBox(h: 25),
              CustomButton(
                text: 'Add Ingredients to Shopping List',
                onTap: () {
                  Get.back();
                  Get.back();
                  baseScreenController.lastSelected = 1;
                  baseScreenController.selectedIndex =
                      baseScreenController.lastSelected;
                },
                padding: 0,
              ),
              getHeightSizedBox(h: 45),
            ],
          ),
        ),
      ),
    );
  }
}

Widget suggestionArrow() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(9),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Container(
        height: 260,
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white.withOpacity(0.22)),
        child: Row(
          children: [
            Container(
              width: kDefaultPadding,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Swipe to add to meal plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: getWidth(16)),
                ),
              ),
            ),
            //getHeightSizedBox(w: kDefaultPadding),
            SvgPicture.asset(AppIcons.arrow)
          ],
        ),
      ),
    ),
  );
}
