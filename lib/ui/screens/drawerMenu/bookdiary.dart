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
import 'package:whatscooking/ui/screens/Recommendations/recommendation.dart';
import 'package:whatscooking/ui/screens/dishDetails/dishDetails.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import '../../../globals.dart';

class BookDiary extends StatefulWidget {
  @override
  _BookDiaryState createState() => _BookDiaryState();
}

class _BookDiaryState extends State<BookDiary>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: bookDiaryList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
          Container(
            height: 40,
            margin:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
            child: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.white.withOpacity(0.22),
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                tabs: List.generate(
                    bookDiaryList.length,
                    (index) => Tab(
                          text: bookDiaryList[index],
                        ))),
          ),
          getHeightSizedBox(h: 20),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [CookDiary(), Favourites()]),
          )
        ],
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
