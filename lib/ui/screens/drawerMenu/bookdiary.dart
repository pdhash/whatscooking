import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/bookDiaryController.dart';
import 'package:whatscooking/ui/screens/dishDetails/dishDetails.dart';
import 'package:whatscooking/ui/screens/homee/recommendation.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import '../../../globals.dart';

class BookDiary extends StatefulWidget {
  @override
  _BookDiaryState createState() => _BookDiaryState();
}

class _BookDiaryState extends State<BookDiary> {
  final BookDiaryController bookDiaryController =
      Get.put(BookDiaryController());
  List list = ['Cook Diary', 'Favorites'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () {
            Get.back();
          },
        ),
        body: Column(
          children: [
            getHeightSizedBox(h: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding + 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    list.length,
                    (index) => GetBuilder(
                          builder: (BookDiaryController controller) =>
                              bottomSheetButton(
                                  title: list[index],
                                  isSelected: index,
                                  onTap: () {
                                    controller.isSelected = index;
                                  }),
                        )),
              ),
            ),
            getHeightSizedBox(h: 25),
            // Expanded(child: CookDiary())
            GetBuilder(
                builder: (BookDiaryController controller) => Expanded(
                    child: controller.isSelected == 0
                        ? CookDiary()
                        : Favourites()))
          ],
        ));
  }

  Widget bottomSheetButton(
      {Function()? onTap, required String title, required int isSelected}) {
    return GetBuilder(
      builder: (BookDiaryController controller) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              border: isSelected == controller.isSelected
                  ? Border(
                      bottom: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ))
                  : Border()),
          //width: 150,

          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getWidth(25),
                    color: isSelected == controller.isSelected
                        ? Colors.white
                        : Colors.white.withOpacity(0.35)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.recFoodBoxPhoto,
                    ),
                    fit: BoxFit.cover)),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: AppColor.kPrimaryColor,
              ),
              onPressed: () {},
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.85),
    );
  }
}

class CookDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
            child: Row(
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Streak: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: getWidth(20)),
                    ),
                    Text(
                      '20 days',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getWidth(20),
                          color: AppColor.kPrimaryColor),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (Platform.isIOS) {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme());
                    } else {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2050));
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        buildSvgImage(
                            image: AppIcons.calendar, height: 20, width: 22),
                        getHeightSizedBox(w: 7),
                        Text(
                          'Go to Date',
                          style: TextStyle(
                            fontSize: getWidth(15),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          getHeightSizedBox(h: 18),
          Row(
            children: [
              Spacer(),
              Text(
                'Total dishes',
                style: TextStyle(
                    fontSize: getWidth(20), fontWeight: FontWeight.w600),
              ),
              getHeightSizedBox(w: 15),
              Text(
                '22',
                style: TextStyle(
                    fontSize: getWidth(22),
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimaryColor),
              ),
              Spacer(),
            ],
          ),
          getHeightSizedBox(h: 15),
          Column(children: List.generate(3, (index) => dateWiseDish()))
        ],
      ),
    );
  }

  Widget dateWiseDish() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Text(
            'May 29, 2021',
            style:
                TextStyle(fontSize: getWidth(20), fontWeight: FontWeight.w600),
          ),
          getHeightSizedBox(h: 15),
          Column(
              children: List.generate(
            3,
            (index) => recFoodBox(
                onTap: () {
                  Get.to(() => DishDetails());
                },
                image: AppImages.recFoodBoxPhoto,
                title: browsList1[index],
                isNotWeight: true),
          )),
        ],
      ),
    );
  }
}
