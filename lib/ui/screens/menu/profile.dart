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
import 'package:whatscooking/ui/screens/menu/myPrefrences.dart';
import 'package:whatscooking/ui/screens/menu/signatureDishes.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'achievements.dart';
import 'browse.dart';

class MyProfile extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
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
            onLeadingButtonTap: () => Get.back()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                ),
                profile(),
                getHeightSizedBox(h: 20),
                Text(
                  'Personal Info',
                  style: TextStyle(
                    fontSize: getWidth(20),
                  ),
                ),
                CustomTextField2(
                  controller: name,
                  hintText: 'Name',
                  giveSpace: false,
                  textInputType: TextInputType.text,
                  prefixWidget: buildSvgImage(
                      image: AppIcons.user, height: 20, width: 20),
                  suffixWidget: buildSvgImage(
                      image: AppIcons.edit, height: 20, width: 20),
                ),
                getHeightSizedBox(h: 10),
                CustomTextField2(
                  controller: mobileNumber,
                  hintText: 'Mobile Number',
                  length: 10,
                  giveSpace: false,
                  textInputType: TextInputType.phone,
                  prefixWidget: buildSvgImage(
                      image: AppIcons.call, height: 20, width: 20),
                  suffixWidget: buildSvgImage(
                      image: AppIcons.edit, height: 20, width: 20),
                ),
                getHeightSizedBox(h: 23),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(MyPreferences());
                    },
                    child: Text(
                      'Go to Preferences',
                      style: TextStyle(
                          fontSize: getWidth(20),
                          color: AppColor.kPrimaryColor),
                    ),
                  ),
                ),
                getHeightSizedBox(h: 23),
                Text(
                  'Your Score',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: getWidth(20)),
                ),
                getHeightSizedBox(h: 20),
                scoreHeader(),
                getHeightSizedBox(h: 23),
                header('Latest Dishes'),
                getHeightSizedBox(h: 23),
                latestDishRow(),
                getHeightSizedBox(h: 35),
                Row(
                  children: [
                    header('Signature Dishes'),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Get.to(() => SignatureDishes()),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.add,
                              size: 18, color: AppColor.kPrimaryColor),
                          Text(
                            ' Add a Dish',
                            style: TextStyle(
                                fontSize: getWidth(15),
                                color: AppColor.kPrimaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                getHeightSizedBox(h: 23),
                signatureDishRow(),
                getHeightSizedBox(h: 35),
                header('Achievements'),
                getHeightSizedBox(h: 23),
                achievements(),
                getHeightSizedBox(h: 35),
                Text(
                  'Top 5 Cuisines',
                  style: TextStyle(
                      fontSize: getWidth(20), fontWeight: FontWeight.w600),
                ),
                getHeightSizedBox(h: 15),
                barBuilder(),
                getHeightSizedBox(h: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget barBuilder() {
    List<Map<String, dynamic>> list = [
      {'name': 'Gujarati', 'per': 90},
      {'name': 'South Indian', 'per': 64},
      {'name': 'Punjabi', 'per': 60},
      {'name': 'Italian', 'per': 56},
      {'name': 'Mexican', 'per': 45},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (index) {
        final width = '0.${list[index]['per']}';
        return Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          height: 42,
          width: (Get.width - 100) * double.parse(width),
          color: AppColor.kPrimaryColor,
          child: Row(
            children: [
              getHeightSizedBox(w: 5),
              Wrap(
                children: [
                  index == 0
                      ? buildSvgImage(
                          image: AppIcons.kingHeadLittle, height: 16, width: 19)
                      : SizedBox(),
                  Text(' ${list[index]['name']}',
                      style: TextStyle(fontSize: getWidth(15)))
                ],
              ),
              Spacer(),
              Text(
                list[index]['per'].toString(),
                style: TextStyle(fontSize: getWidth(15)),
              ),
              getHeightSizedBox(w: 5),
            ],
          ),
        );
      }),
    );
  }

  SingleChildScrollView achievements() {
    List<Map<String, dynamic>> list = [
      {'image': AppIcons.medal, 'title': 'Master of Cuisines'},
      {'image': AppIcons.kingHead, 'title': 'Master HomeChef'},
      {'image': AppIcons.chefPro, 'title': 'ChefPro'},
    ];
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          list.length,
          (index) => GestureDetector(
            onTap: () {
              Get.to(()=>Achievements());
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              width: 139,
              height: 163,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  SvgPicture.asset(list[index]['image']),
                  Spacer(),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list[index]['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: getWidth(17),
                            color: AppColor.kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row scoreHeader() {
    return Row(
        children: List.generate(
            3,
            (index) => Expanded(
                  child: Column(
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getWidth(25)),
                      ),
                      Text(
                        'Ethenic Cuisines made',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: getWidth(12)),
                      ),
                    ],
                  ),
                )));
  }

  SingleChildScrollView signatureDishRow() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Container(
              margin: EdgeInsets.only(right: 20),
              width: 139,
              height: 163,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.recFoodBoxPhoto),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildSvgImage(
                          image: AppIcons.kingHeadLittle,
                          height: 20,
                          width: 28),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 15),
                      child: Text(
                        'Pav Bhaji',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getWidth(16)),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  SingleChildScrollView latestDishRow() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Container(
              margin: EdgeInsets.only(right: 20),
              width: 139,
              height: 163,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.recFoodBoxPhoto),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15),
                child: Text(
                  'Pav Bhaji',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(16)),
                ),
              )),
        ),
      ),
    );
  }

  Text header(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(26)),
    );
  }

  Center profile() {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  right: 0,
                  left: 0,
                  top: -38,
                  child: buildSvgImage(
                      image: AppIcons.kingHead, height: 48, width: 67)),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(AppImages.background),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          getHeightSizedBox(h: 10),
          Text(
            'Master HomeChef',
            style: TextStyle(
                fontSize: getWidth(15), color: AppColor.kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
