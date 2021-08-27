import 'package:flutter/cupertino.dart';
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
import 'package:whatscooking/ui/screens/menu/browse.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

import 'home.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  void initState() {
    openBottomSheet();
    super.initState();
  }

  final TextEditingController caption = TextEditingController();

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
            onLeadingButtonTap: () => Get.back(),
            onActionButtonTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: 300,
                ),
              );
            }),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              getHeightSizedBox(h: 10),
              header(),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          buildCircleProfile(
                              image: AppImages.background,
                              height: 40,
                              width: 40),
                        ],
                      ),
                      getHeightSizedBox(w: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getHeightSizedBox(h: 10),
                          Text(
                            'Jane Doe',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: getWidth(18)),
                          ),
                          getHeightSizedBox(h: 20),
                          dropDownButton(context),
                          getHeightSizedBox(h: 7),
                          CustomTextField2(
                              controller: caption,
                              width: getWidth(260),
                              height: 40,
                              hintText: 'Write something about your dish')
                        ],
                      ),
                    ],
                  ),
                  getHeightSizedBox(h: 30),
                  post()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector post() {
    return GestureDetector(
      onTap: () {
        openBottomSheet();
      },
      child: Container(
        height: 200,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white12, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            'Upload A Image',
            style: TextStyle(color: AppColor.kPrimaryColor),
          ),
        ),
      ),
    );
  }

  GestureDetector dropDownButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => SizedBox(
            height: 200,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              itemExtent: 30,
              scrollController: FixedExtentScrollController(initialItem: 1),
              children: [
                Text('0'),
                Text('1'),
                Text('2'),
              ],
              onSelectedItemChanged: (value) {},
            ),
          ),
        );
      },
      child: Container(
        height: getWidth(34),
        width: getWidth(105),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffD8D8D8), width: 1.5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(AppIcons.relational),
              Text(
                'Family',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: getWidth(14)),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xff8A8A8F),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openBottomSheet() {
    Future.delayed(Duration(seconds: 0)).then((_) {
      showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          barrierColor: Colors.transparent,
          builder: (builder) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
            );
          });
    });
  }

  Widget header() {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        Text(
          'Meal Plan ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(25)),
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          'Post',
          style: TextStyle(
              color: AppColor.kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontSize: getWidth(20)),
        ),
      ],
    );
  }
}
