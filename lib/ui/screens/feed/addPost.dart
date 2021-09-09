import 'dart:io';

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
import 'package:whatscooking/core/viewmodels/controllers/addpostController.dart';
import 'package:whatscooking/globals.dart';
import 'package:whatscooking/ui/screens/notification/notificationScreen.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customTextfield.dart';
import 'package:whatscooking/ui/shared/imagePicker.dart';

import 'feed.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  void initState() {
    //openBottomSheet();
    super.initState();
  }

  final TextEditingController caption = TextEditingController();
  final AddPostController addPostController = Get.put(AddPostController());
  // final ImagePickerController imagePickerController =
  //     Get.find<ImagePickerController>();

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
          onLeadingButtonTap: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              getHeightSizedBox(h: 10),
              header(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
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
                        Expanded(
                          child: Column(
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
                                  textInputType: TextInputType.multiline,
                                  minLines: 1,
                                  height: 50,
                                  maxLines: 3,
                                  hintText: 'Write something about your dish')
                            ],
                          ),
                        ),
                      ],
                    ),
                    getHeightSizedBox(h: 30),
                    post()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget post() {
    return GetBuilder(
      builder: (ImagePickerController controller) => GestureDetector(
        onTap: () {
          appImagePicker.openBottomSheet(context: context);
          //openBottomSheet();
        },
        child: Container(
            height: 300,
            width: Get.width,
            decoration: BoxDecoration(
                border: controller.image != null
                    ? Border()
                    : Border.all(color: Colors.white12, width: 1),
                borderRadius: BorderRadius.circular(10),
                image: controller.image == null
                    ? null
                    : DecorationImage(
                        image: FileImage(controller.image as File),
                        fit: BoxFit.cover)),
            child: controller.image == null
                ? Center(
                    child: Text(
                      'Upload A Image',
                      style: TextStyle(color: AppColor.kPrimaryColor),
                    ),
                  )
                : null),
      ),
    );
  }

  Widget dropDownButton(BuildContext context) {
    return GetBuilder(
      builder: (AddPostController controller) => GestureDetector(
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (_) => SizedBox(
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(
                    initialItem: controller.defaultSet),
                children: List.generate(controller.list.length,
                    (index) => Text(controller.list[index])),
                onSelectedItemChanged: (value) {
                  controller.defaultSet = value;
                },
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
                  controller.list[controller.defaultSet],
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
      ),
    );
  }

  void openBottomSheet() {
    Future.delayed(Duration(seconds: 0)).then(
      (_) {
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
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  getHeightSizedBox(h: 5),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Color(0xff8A8A8F),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  getHeightSizedBox(h: 25),
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: false,
                      children: List.generate(
                        9,
                        (index) => GestureDetector(
                          onTap: () {
                            Get.back();
                            if (index == 0)
                              appImagePicker.openBottomSheet(context: context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: index == 0
                                    ? Color(0xff2D2D2D)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: index == 0
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(AppIcons.camera),
                                        getHeightSizedBox(h: 10),
                                        Text(
                                          'Take Photo',
                                          style: TextStyle(
                                              fontSize: getWidth(13),
                                              color: Color(0xff8A8A8F)),
                                        )
                                      ],
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Spacer(
            flex: 3,
          ),
          Text(
            'Add Post',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(25)),
          ),
          Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
              //  appImagePicker.imagePickerController.reset();
            },
            child: Text(
              'Post',
              style: TextStyle(
                  color: AppColor.kPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: getWidth(20)),
            ),
          ),
        ],
      ),
    );
  }
}
