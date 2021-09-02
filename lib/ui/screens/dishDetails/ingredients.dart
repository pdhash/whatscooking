import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/dishDetailController.dart';
import 'package:whatscooking/ui/screens/drawerMenu/shoppingList.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import '../../../globals.dart';

class Ingredients extends StatefulWidget {
  final int index;

  const Ingredients({Key? key, required this.index}) : super(key: key);
  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  final DishDetailController dishDetailController =
      Get.put(DishDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.like,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () => Get.back()),
      extendBodyBehindAppBar: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onBoardingBackGround),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: CustomButton(
                text: 'Yes, Im making this!',
                onTap: () {},
                color: AppColor.kPrimaryColor.withOpacity(0.65),
                height: 60,
                width: 233,
                radius: 60,
              ),
            ),
            getHeightSizedBox(h: 10),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColor.kScaffoldColor,
                  ),
                  child: OpenBottomSheet(index: widget.index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpenBottomSheet extends StatefulWidget {
  final int index;

  const OpenBottomSheet({Key? key, required this.index}) : super(key: key);
  @override
  _OpenBottomSheetState createState() => _OpenBottomSheetState();
}

class _OpenBottomSheetState extends State<OpenBottomSheet>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: dishDetailList.length, vsync: this, initialIndex: widget.index);
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(microseconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    tabController.dispose();
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  final DishDetailController dishDetailController =
      Get.find<DishDetailController>();

  @override
  Widget build(BuildContext context) {
    dishDetailController.isSelected = widget.index;

    return GetBuilder(
      builder: (DishDetailController controller) {
        return Column(
          children: [
            getHeightSizedBox(h: 30),
            Container(
              height: 5,
              width: 75,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(50)),
            ),
            getHeightSizedBox(h: 25),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                labelStyle: TextStyle(
                    fontSize: getWidth(25), fontWeight: FontWeight.bold),
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.white.withOpacity(0.22),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: List.generate(
                  dishDetailList.length,
                  (index) => Tab(
                    text: dishDetailList[index],
                  ),
                ),
              ),
            ),
            getHeightSizedBox(h: 20),
            Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: [ingredients(), recipe()]))
          ],
        );
      },
    );
  }

  Widget recipe() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
              children: List.generate(
                  3,
                  (index) => stepContainer(
                      index: index,
                      title:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et officia deserunt mollit anim id est laborum.',
                      image: AppImages.background))),
          Wrap(
            children: [
              Text(
                'Enjoy',
                style: TextStyle(fontSize: getWidth(20)),
              ),
              Text(
                '  : )',
                style: TextStyle(
                    fontSize: getWidth(20), fontWeight: FontWeight.w900),
              )
            ],
          ),
          getHeightSizedBox(h: 40)
        ],
      ),
    );
  }

  Widget stepContainer(
      {required int index, required String title, required String image}) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding - 17),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Step ${index + 1}',
                style: TextStyle(fontSize: getWidth(20)),
              ),
              getHeightSizedBox(h: 10),
              Container(
                height: getWidth(70),
                width: getWidth(70),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              getHeightSizedBox(h: 12),
              Container(
                height: index == 2 ? 7 : 60,
                width: 5,
                color: Colors.white,
              )
            ],
          ),
          getHeightSizedBox(w: kDefaultPadding),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: getWidth(16)),
            ),
          )
        ],
      ),
    );
  }

  Widget ingredients() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding + 30),
            child: Row(
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppColor.kPrimaryColor,
                    ),
                    getHeightSizedBox(w: 3),
                    Text(
                      ' 30 min',
                      style: TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontSize: getWidth(16),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Spacer(),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '3 portions',
                      style: TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontSize: getWidth(16),
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          getHeightSizedBox(h: 25),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) => itemNut(index: index))),
          getHeightSizedBox(h: 25),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
            child: Text(
              'Things you might not have',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: getWidth(16)),
            ),
          ),
          Column(
            children: List.generate(4, (index) => checkBoxListTile()),
          ),
          getHeightSizedBox(h: 5),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
            child: Text(
              'Things you might have',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: getWidth(16)),
            ),
          ),
          getHeightSizedBox(h: 5),
          Column(
            children: List.generate(4, (index) => checkBoxListTile()),
          ),
          getHeightSizedBox(h: 10),
          CustomButton(
              text: '4 items       Add to shopping List',
              onTap: () {
                Get.to(() => ShoppingList());
              }),
          getHeightSizedBox(h: 40),
        ],
      ),
    );
  }

  Widget itemNut({required int index}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: index == 3
                ? Border()
                : Border(right: BorderSide(color: Colors.white, width: 1))),
        child: Column(
          children: [
            Text(
              'Calories',
              style: TextStyle(fontSize: getWidth(13)),
            ),
            getHeightSizedBox(h: 4),
            Text(
              '242',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: getWidth(16)),
            ),
            getHeightSizedBox(h: 4),
            Text(
              'Kcal',
              style: TextStyle(fontSize: getWidth(13)),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkBoxListTile() {
    return GetBuilder(
      builder: (DishDetailController controller) => Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 5, horizontal: kDefaultPadding),
        child: Row(children: [
          IconButton(
            onPressed: () {
              controller.isCheck = !controller.isCheck;
            },
            icon: buildSvgImage(
              image: controller.isCheck ? AppIcons.check : AppIcons.unCheck,
              height: 19,
              width: 19,
            ),
          ),
          getHeightSizedBox(w: 15),
          Text(
            'Paneer',
            style:
                TextStyle(fontSize: getWidth(16), fontWeight: FontWeight.w600),
          ),
          Spacer(),
          Text(
            '500gm',
            style:
                TextStyle(fontSize: getWidth(16), fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}
