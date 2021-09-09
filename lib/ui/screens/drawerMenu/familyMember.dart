import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/appFunctions.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/prefrencesController.dart';
import 'package:whatscooking/ui/screens/notification/notificationScreen.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/customTextfield.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'myPrefrences.dart';

class FamilyMember extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  final TextEditingController relation = TextEditingController();
  final TextEditingController age = TextEditingController();
  final MyPreferencesController myPreferencesController =
      Get.find<MyPreferencesController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        appBar: appBar(
            appBarActionButtonType: AppBarActionButtonType.notification,
            appBarLeadingButtonType: AppBarLeadingButtonType.back,
            onActionButtonTap: () => Get.to(() => Notifications()),
            onLeadingButtonTap: () => Get.back()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeightSizedBox(h: 20),
                Center(
                  child: Text(
                    'Add Family Member',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                  ),
                ),
                getHeightSizedBox(h: 20),
                Text(
                  'Personal Info',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: getWidth(20)),
                ),
                getHeightSizedBox(h: 10),
                CustomTextField2(
                    height: 47,
                    controller: search,
                    hintText: 'Name',
                    giveSpace: true,
                    prefixWidget: buildSvgImage(
                        image: AppIcons.user, height: 18, width: 15)),
                getHeightSizedBox(h: 10),
                CustomTextField2(
                    height: 47,
                    controller: relation,
                    hintText: 'Relation to you',
                    giveSpace: true,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: SvgPicture.asset(
                        AppIcons.relation,
                      ),
                    )),
                getHeightSizedBox(h: 10),
                CustomTextField2(
                    height: 47,
                    controller: age,
                    textInputType: TextInputType.number,
                    hintText: 'Age',
                    giveSpace: true,
                    prefixWidget: buildSvgImage(
                        image: AppIcons.user, height: 18, width: 15)),
                getHeightSizedBox(h: 25),
                Row(
                  children: [
                    Text(
                      'Preferences ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: getWidth(20)),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Color(0xff8B8B8B),
                      size: 20,
                    ),
                    Spacer(),
                    Text(
                      'Reset',
                      style: TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                getHeightSizedBox(h: 25),

                ///--------------------------------------------------------------------------------
                header('Exceptions'),
                getHeightSizedBox(h: 5),
                CustomTextField2(
                  height: 47,
                  controller: search,
                  hintText: "Enter a dish you don't like",
                  giveSpace: true,
                  suffixWidget: GestureDetector(
                    onTap: () {
                      disposeKeyboard();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Add',
                        style: TextStyle(color: AppColor.kPrimaryColor),
                      ),
                    ),
                  ),
                  prefixWidget: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                getHeightSizedBox(h: 30),
                grid1(),
                getHeightSizedBox(h: 20),
                Divider(
                  height: 0,
                  color: Colors.white38,
                ),
                getHeightSizedBox(h: 25),

                ///-----------------------------------------------------------------------------------
                header('Add Health Precautions'),
                getHeightSizedBox(h: 5),
                CustomTextField2(
                  height: 47,
                  controller: search,
                  hintText: "Serach",
                  giveSpace: true,
                  prefixWidget: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixWidget: GestureDetector(
                    onTap: () {
                      disposeKeyboard();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Add',
                        style: TextStyle(color: AppColor.kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                getHeightSizedBox(h: 30),
                grid2(),
                getHeightSizedBox(h: 20),
                Divider(
                  height: 0,
                  color: Colors.white38,
                ),
                getHeightSizedBox(h: 25),

                ///---------------------------------------------------------------------------------------

                Text(
                  'Add Allergies  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(14)),
                ),
                getHeightSizedBox(h: 5),
                CustomTextField2(
                  height: 47,
                  controller: search,
                  hintText: "Search",
                  suffixWidget: GestureDetector(
                    onTap: () {
                      disposeKeyboard();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Add',
                        style: TextStyle(color: AppColor.kPrimaryColor),
                      ),
                    ),
                  ),
                  giveSpace: true,
                  prefixWidget: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                getHeightSizedBox(h: 30),
                grid3(),
                getHeightSizedBox(h: 20),

                CustomButton(
                  text: 'Save',
                  onTap: () {
                    disposeKeyboard();
                    Get.back();
                  },
                  padding: 0,
                ),
                getHeightSizedBox(h: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomGrid grid3() {
    return CustomGrid(
      aspectRatio: 4,
      crossAxisCount: 2,
      child: List.generate(
        4,
        (index) => Container(
            decoration: BoxDecoration(
                color: Color(0xff4A4A4A),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  index == 3 ? 'View all' : 'Bengan Bharta',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: getWidth(12)),
                ),
                Spacer(),
                index == 3
                    ? SizedBox()
                    : GestureDetector(
                        onTap: () {
                          disposeKeyboard();
                        },
                        child: Icon(
                          Icons.close,
                          size: 20,
                        ),
                      )
              ],
            )
            // margin: EdgeInsets.symmetric(horizontal: 10),
            ),
      ),
    );
  }

  Widget grid2() {
    return GetBuilder(
      builder: (MyPreferencesController controller) => CustomGrid(
        aspectRatio: 4,
        crossAxisCount: 2,
        child: List.generate(
          6,
          (index) => GestureDetector(
            onTap: index == 5
                ? null
                : () {
                    if (controller.healthList.contains(index))
                      controller.removeH(index);
                    else
                      controller.addH(index);
                  },
            child: Container(
                decoration: BoxDecoration(
                    color: controller.healthList.contains(index)
                        ? AppColor.kPrimaryColor.withOpacity(0.2)
                        : Color(0xff4A4A4A),
                    border: controller.healthList.contains(index)
                        ? Border.all(color: AppColor.kPrimaryColor, width: 1)
                        : Border(),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    getHeightSizedBox(w: 25),
                    Text(
                      index == 5 ? 'more...' : 'Gujarati',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: getWidth(12),
                          color: controller.healthList.contains(index)
                              ? AppColor.kPrimaryColor
                              : Colors.white),
                    ),
                  ],
                )
                // margin: EdgeInsets.symmetric(horizontal: 10),
                ),
          ),
        ),
      ),
    );
  }

  CustomGrid grid1() {
    return CustomGrid(
      aspectRatio: 4,
      crossAxisCount: 2,
      child: List.generate(
        6,
        (index) => GestureDetector(
          onTap: () {
            //print(index);
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff4A4A4A),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    index == 5 ? "View all" : 'Bengan Bharta',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: getWidth(12)),
                  ),
                  Spacer(),
                  index == 5
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            print(index);
                          },
                          child: Icon(
                            Icons.close,
                            size: 20,
                          ),
                        )
                ],
              )
              // margin: EdgeInsets.symmetric(horizontal: 10),
              ),
        ),
      ),
    );
  }
}
