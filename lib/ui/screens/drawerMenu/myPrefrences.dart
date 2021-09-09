import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/appFunctions.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/prefrencesController.dart';
import 'package:whatscooking/ui/screens/notification/notificationScreen.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/customTextfield.dart';

import 'familyMember.dart';

class MyPreferences extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  final MyPreferencesController myPreferencesController =
      Get.put(MyPreferencesController());
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
                    'My Preferences',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                  ),
                ),
                getHeightSizedBox(h: 20),
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
                          fontWeight: FontWeight.w600,
                          fontSize: getWidth(14)),
                    )
                  ],
                ),
                getHeightSizedBox(h: 30),

                ///---------------------------------------------------------------------------------------

                header('Cuisines I Eat normally'),
                getHeightSizedBox(h: 5),
                CustomTextField2(
                  height: 47,
                  controller: search,
                  hintText: 'Search',
                  giveSpace: true,
                  prefixWidget: Icon(
                    Icons.search,
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

                ///---------------------------------------------------------------------------------------

                header('Exceptions'),
                getHeightSizedBox(h: 5),
                CustomTextField2(
                  height: 47,
                  controller: search,
                  hintText: "Enter a dish you don't like",
                  giveSpace: true,
                  suffix: GestureDetector(
                    onTap: () {
                      disposeKeyboard();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: AppColor.kPrimaryColor),
                    ),
                  ),
                  prefixWidget: Icon(
                    Icons.add,
                    color: Colors.white,
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

                header('Add Health Precautions'),
                getHeightSizedBox(h: 5),
                CustomTextField2(
                  height: 47,
                  controller: search,
                  hintText: "Enter a dish you don't like",
                  giveSpace: false,
                  prefixWidget: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffix: GestureDetector(
                    onTap: () {
                      disposeKeyboard();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: AppColor.kPrimaryColor),
                    ),
                  ),
                ),
                getHeightSizedBox(h: 30),
                grid3(),
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
                  hintText: "Enter a dish you don't like",
                  suffix: GestureDetector(
                    onTap: () {
                      disposeKeyboard();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: AppColor.kPrimaryColor),
                    ),
                  ),
                  giveSpace: false,
                  prefixWidget: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                getHeightSizedBox(h: 30),
                grid4(),
                getHeightSizedBox(h: 20),
                Divider(
                  height: 0,
                  color: Colors.white38,
                ),
                getHeightSizedBox(h: 25),

                ///---------------------------------------------------------------------------------------
                Text(
                  'Add Family Members',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(14)),
                ),

                getHeightSizedBox(h: 25),
                grid5(),
                getHeightSizedBox(h: 20),
                Divider(
                  height: 0,
                  color: Colors.white38,
                ),
                getHeightSizedBox(h: 25),

                /// ---------------------------------------------------------------------
                Text(
                  'Special Instructions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(14)),
                ),

                getHeightSizedBox(h: 25),
                grid6(),
                getHeightSizedBox(h: 20),
                CustomButton(
                  text: 'Save',
                  onTap: () {
                    Get.back();
                    disposeKeyboard();
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

  Widget grid6() {
    return Column(
      children: [
        CustomGrid(
          aspectRatio: 8,
          crossAxisCount: 1,
          child: List.generate(
            2,
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
                    GestureDetector(
                      onTap: () {
                        print(index);
                      },
                      child: Icon(
                        Icons.close,
                        size: 20,
                      ),
                    )
                  ],
                )),
          ),
        ),
        getHeightSizedBox(h: 8),
        AspectRatio(
          aspectRatio: 8,
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff4A4A4A),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getWidth(12),
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 7),
                          border: InputBorder.none,
                          hintText: 'Add instruction',
                          hintStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: getWidth(12),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  getHeightSizedBox(w: 10),
                  GestureDetector(
                    onTap: () {
                      disposeKeyboard();
                    },
                    child: Icon(Icons.add),
                  )
                ],
              )),
        )
      ],
    );
  }

  Widget grid5() {
    return Column(
      children: [
        CustomGrid(
          aspectRatio: 8,
          crossAxisCount: 1,
          child: List.generate(
            2,
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
                    GestureDetector(
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
        getHeightSizedBox(h: 7),
        AspectRatio(
          aspectRatio: 8,
          child: GestureDetector(
            onTap: () {
              disposeKeyboard();

              Get.to(() => FamilyMember());
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff4A4A4A),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Add Family member',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: getWidth(12),
                          color: Colors.white54),
                    ),
                    Spacer(),
                    Icon(
                      Icons.add,
                      size: 20,
                    )
                  ],
                )
                // margin: EdgeInsets.symmetric(horizontal: 10),
                ),
          ),
        )
      ],
    );
  }

  CustomGrid grid4() {
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

  Widget grid3() {
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

  CustomGrid grid2() {
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

  Widget grid1() {
    return GetBuilder(
      builder: (MyPreferencesController controller) => CustomGrid(
        aspectRatio: 2.8,
        crossAxisCount: 3,
        child: List.generate(
          9,
          (index) => GestureDetector(
            onTap: index == 8
                ? null
                : () {
                    if (controller.cuisinesList.contains(index))
                      controller.remove(index);
                    else
                      controller.add(index);
                  },
            child: Container(
                decoration: BoxDecoration(
                    color: controller.cuisinesList.contains(index)
                        ? AppColor.kPrimaryColor.withOpacity(0.2)
                        : Color(0xff4A4A4A),
                    borderRadius: BorderRadius.circular(8),
                    border: controller.cuisinesList.contains(index)
                        ? Border.all(color: AppColor.kPrimaryColor, width: 1)
                        : Border()),
                child: Center(
                    child: Text(
                  index == 8 ? 'more...' : 'Gujarati',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: getWidth(12),
                      color: controller.cuisinesList.contains(index)
                          ? AppColor.kPrimaryColor
                          : Colors.white),
                ))
                // margin: EdgeInsets.symmetric(horizontal: 10),
                ),
          ),
        ),
      ),
    );
  }
}

class CustomGrid extends StatelessWidget {
  final Function()? onTap;
  final int crossAxisCount;
  final List<Widget> child;
  final double aspectRatio;
  const CustomGrid({
    Key? key,
    this.onTap,
    required this.crossAxisCount,
    required this.child,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // primary: true,
      shrinkWrap: true, padding: EdgeInsets.zero,
      mainAxisSpacing: 7,
      crossAxisSpacing: 7, childAspectRatio: aspectRatio,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      children: child,
    );
  }
}

Text header(String title) {
  return Text(
    title,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(14)),
  );
}
