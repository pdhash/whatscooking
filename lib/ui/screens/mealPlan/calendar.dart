import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/core/viewmodels/controllers/mealPlanController.dart';
import 'package:whatscooking/ui/screens/drawerMenu/browse.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/dateRangePicker.dart';

import '../../../globals.dart';

class MealPlan extends StatefulWidget {
  @override
  _MealPlanState createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  final MealPlanController mealPlanController = Get.put(MealPlanController());

  final GlobalRangePicker globalRangePicker = GlobalRangePicker();
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(),
                      getHeightSizedBox(h: 25),
                      Text(
                        'Choose intervals',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: getWidth(20)),
                      ),
                      getHeightSizedBox(h: 20),
                      intervalsColumn(),
                      getHeightSizedBox(h: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                          getHeightSizedBox(w: 20),
                          dateChoose(),
                          getHeightSizedBox(w: 20),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                      getHeightSizedBox(h: 20),
                    ],
                  ),
                ),
              )
            ],
        body: pageViews());
  }

  Row header() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.to(() => Browse());
          },
          padding: EdgeInsets.zero,
          icon: Icon(Icons.search),
          constraints: BoxConstraints.loose(Size(30, 30)),
        ),
        Spacer(
          flex: 4,
        ),
        Text(
          'Meal Plan ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(25)),
        ),
        Icon(
          Icons.info_outline,
          color: Color(0xff8B8B8B),
          size: 20,
        ),
        Spacer(
          flex: 3,
        ),
        Text(
          'Reset',
          style: TextStyle(
              color: AppColor.kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontSize: getWidth(14)),
        ),
      ],
    );
  }

  Widget pageViews() {
    PageController pageController = PageController(initialPage: 0);
    return PageView(
      controller: pageController,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: WeeklyPlan2(
            onCircleTap: () {
              pageController.animateToPage(2,
                  duration: Duration(microseconds: 1), curve: Curves.ease);
            },
          ),
        ),
        BrowsePageView2(),
      ],
    );
  }

  Widget dateChoose() {
    return GetBuilder(
      builder: (MealPlanController controller) => GestureDetector(
        onTap: () {
          controller.showChooseDialog();
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(
            controller.dateStr == null
                ? "${dateNameConverter(DateTime.now())} - ${dateNameConverter(
                    DateTime.now().add(
                      Duration(
                          days: controller.isSelected == 1
                              ? list[controller.isSelected]['number'] -
                                  DateTime.now().weekday
                              : list[controller.isSelected]['number'] - 1),
                    ),
                  )}"
                : controller.dateStr.toString(),
            style: TextStyle(fontSize: getWidth(16)),
          ),
        ),
      ),
    );
  }

  Column intervalsColumn() {
    return Column(
      children: List.generate(
        3,
        (index) => GetBuilder(
          builder: (MealPlanController controller) => GestureDetector(
            onTap: () {
              controller.isSelected = index;
              controller.dateStr = null;
            },
            child: Container(
              height: 40,
              width: Get.width,
              margin: EdgeInsets.only(bottom: 7),
              decoration: BoxDecoration(
                  border: controller.isSelected == index
                      ? Border.all(color: AppColor.kPrimaryColor, width: 1)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  color: controller.isSelected == index
                      ? AppColor.kPrimaryColor.withOpacity(0.2)
                      : Color(0xff4A4A4A)),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  list[index]['title'],
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: getWidth(12),
                      color: controller.isSelected == index
                          ? AppColor.kPrimaryColor
                          : null),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BrowsePageView2 extends StatelessWidget {
  const BrowsePageView2({
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding, vertical: 10),
                      child: Container(
                        height: getHeight(560),
                        width: Get.width,
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
                                    icon: SvgPicture.asset(
                                        AppIcons.kingHeadLittle),
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
                                padding:
                                    const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                child: Text(
                                  'Egg Omlet',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    index == 0 ? suggestionArrow() : SizedBox()
                  ],
                )),
      ),
    );
  }
}

class WeeklyPlan2 extends StatelessWidget {
  final MealPlanController mealPlanController = Get.find<MealPlanController>();
  final Function()? onCircleTap;
  final BaseScreenController baseScreenController =
      Get.find<BaseScreenController>();

  WeeklyPlan2({Key? key, this.onCircleTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (MealPlanController controller) => SingleChildScrollView(
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
    );
  }
}

// Widget build(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//         child: Column(
//           children: [
//             Center(
//               child: Text(
//                 'Add button to go to browse page',
//                 style: TextStyle(fontSize: getWidth(14)),
//               ),
//             ),
//             getHeightSizedBox(h: 10),
//             Row(
//               children: [
//                 Spacer(
//                   flex: 3,
//                 ),
//                 Text(
//                   'Meal Plan ',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: getWidth(25)),
//                 ),
//                 Icon(
//                   Icons.info_outline,
//                   color: Color(0xff8B8B8B),
//                   size: 20,
//                 ),
//                 Spacer(
//                   flex: 2,
//                 ),
//                 Text(
//                   'Reset',
//                   style: TextStyle(
//                       color: AppColor.kPrimaryColor,
//                       fontWeight: FontWeight.w600,
//                       fontSize: getWidth(14)),
//                 ),
//               ],
//             ),
//             getHeightSizedBox(h: 25),
//             Text(
//               'Choose intervals',
//               style: TextStyle(
//                   fontWeight: FontWeight.w600, fontSize: getWidth(20)),
//             ),
//             getHeightSizedBox(h: 20),
//             intervalsColumn(),
//             getHeightSizedBox(h: 35),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.arrow_back_ios,
//                   size: 15,
//                 ),
//                 getHeightSizedBox(w: 20),
//                 dateChoose(),
//                 getHeightSizedBox(w: 20),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   size: 15,
//                 ),
//               ],
//             ),
//             getHeightSizedBox(h: 20),
//           ],
//         ),
//       ),
//       Expanded(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     WeeklyPlan(),
//                     getHeightSizedBox(w: 20),
//                     SingleChildScrollView(child: BrowsePageView2())
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )
//     ],
//   );
// }
