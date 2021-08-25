import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/bookDiaryController.dart';
import 'package:whatscooking/ui/screens/recommendations/recommendation.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'browse.dart';

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
            Expanded(child: Favourites())
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
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Card(
            child: Image.asset(
              AppImages.recFoodBoxPhoto,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
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
                      'Streak:  ',
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
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    buildSvgImage(
                        image: AppIcons.calendar, height: 20, width: 22),
                    Text(
                      'Go to Date',
                      style: TextStyle(
                        fontSize: getWidth(15),
                      ),
                    ),
                  ],
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
                image: AppImages.recFoodBoxPhoto,
                title: browsList1[index],
                isNotWeight: true),
          )),
        ],
      ),
    );
  }
}
