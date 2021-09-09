// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:whatscooking/core/constant/appColors.dart';
// import 'package:whatscooking/core/constant/appIcons.dart';
// import 'package:whatscooking/core/constant/appImages.dart';
// import 'package:whatscooking/core/constant/appSettings.dart';
// import 'package:whatscooking/core/enums.dart';
// import 'package:whatscooking/core/utils/config.dart';
// import 'package:whatscooking/core/viewmodels/controllers/dishDetailController.dart';
// import 'package:whatscooking/ui/screens/shoppingList/shoppingList.dart';
// import 'package:whatscooking/ui/shared/customAppBar.dart';
// import 'package:whatscooking/ui/shared/customButton.dart';
// import 'package:whatscooking/ui/shared/setbackgroundimage.dart';
//
// import '../../../globals.dart';
//
// class DishDetails extends StatefulWidget {
//   @override
//   _DishDetailsState createState() => _DishDetailsState();
// }
//
// class _DishDetailsState extends State<DishDetails>
//     with TickerProviderStateMixin {
//   final DishDetailController dishDetailController =
//       Get.put(DishDetailController());
//   late TabController tabController;
//
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   @override
//   void initState() {
//     tabController = TabController(length: dishDetailList.length, vsync: this);
//     _controller = AnimationController(
//       upperBound: 1,
//       lowerBound: 0,
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     )..forward();
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(
//         appBarActionButtonType: AppBarActionButtonType.like,
//         appBarLeadingButtonType: AppBarLeadingButtonType.back,
//         onLeadingButtonTap: () => Get.back(),
//       ),
//       extendBodyBehindAppBar: true,
//       body: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(AppImages.onBoardingBackGround),
//                     fit: BoxFit.cover)),
//             child: func(),
//           ),
//           SafeArea(
//               child: GetBuilder(builder: (DishDetailController controller) {
//             print(controller.isShow);
//             return controller.isShow == 1
//                 ? makingButton(color: AppColor.kPrimaryColor.withOpacity(0.6))
//                 : SizedBox();
//           }))
//         ],
//       ),
//     );
//   }
//
//   Widget func() {
//     return GetBuilder(
//       builder: (DishDetailController controller) => DraggableScrollableSheet(
//         initialChildSize: 0.40,
//         maxChildSize: 0.75,
//         minChildSize: 0.40,
//         builder: (BuildContext context, ScrollController scrollController) {
//           return LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//               var gh = (Get.height * 0.75 / constraints.minHeight) - 1;
//               double h() => (1 > gh && gh > 0)
//                   ? gh
//                   : (gh > 0)
//                       ? 1
//                       : 0;
//
//               if (h() == 0 && controller.isShow == 0) {
//                 Future.delayed(Duration.zero, () {
//                   controller.isShow = 1;
//                 });
//               } else if (h() > 0 && controller.isShow == 1) {
//                 Future.delayed(Duration.zero, () {
//                   controller.isShow = 0;
//                 });
//               }
//               return ClipRRect(
//                 borderRadius: h() == 0
//                     ? BorderRadius.only(
//                         topRight: Radius.circular(30),
//                         topLeft: Radius.circular(30),
//                       )
//                     : BorderRadius.circular(0),
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Column(
//                     // shrinkWrap: false,
//                     // padding: EdgeInsets.zero,
//                     // // physics: constraints.biggest.height == Get.height * 0.75
//                     // //     ? NeverScrollableScrollPhysics()
//                     // //     : null,
//                     // controller: scrollController,
//                     children: [
//                       Row(
//                         children: [
//                           Opacity(
//                             opacity: h(),
//                             child: Container(
//                               padding: EdgeInsets.fromLTRB(5, 3, 20, 3),
//                               decoration: BoxDecoration(
//                                   color: AppColor.kPrimaryColor,
//                                   borderRadius: BorderRadius.only(
//                                       bottomRight: Radius.circular(50),
//                                       topRight: Radius.circular(50))),
//                               child: Wrap(
//                                 crossAxisAlignment: WrapCrossAlignment.center,
//                                 spacing: 5,
//                                 children: [
//                                   Icon(Icons.access_time),
//                                   Text(
//                                     '30m',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 15),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         color:
//                             Colors.black.withOpacity(h() > 0.20 ? 0.20 : h()),
//                         child: Column(
//                           children: [
//                             Opacity(
//                               opacity: h(),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 7,
//                                     horizontal: kDefaultPadding - 5),
//                                 child: Text(
//                                   'Mughle Shahi Butter Paneer Masala',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: getWidth(34)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(),
//                             Container(
//                               width: Get.width,
//                               decoration: BoxDecoration(
//                                   color: AppColor.kScaffoldColor,
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(35),
//                                       topRight: Radius.circular(35))),
//                               child: Column(
//                                 children: [
//                                   getHeightSizedBox(h: 30),
//                                   Opacity(opacity: h(), child: makingButton()),
//                                   getHeightSizedBox(h: 15),
//                                   Container(
//                                     height: 40,
//                                     margin:
//                                         EdgeInsets.symmetric(horizontal: 30),
//                                     child: TabBar(
//                                       controller: tabController,
//                                       indicatorColor: Colors.white,
//                                       labelStyle: TextStyle(
//                                           fontSize: getWidth(25),
//                                           fontWeight: FontWeight.bold),
//                                       labelPadding: EdgeInsets.zero,
//                                       unselectedLabelColor:
//                                           Colors.white.withOpacity(0.22),
//                                       indicatorSize: TabBarIndicatorSize.label,
//                                       tabs: List.generate(
//                                         dishDetailList.length,
//                                         (index) => Tab(
//                                           text: dishDetailList[index],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                   Column(
//                                     children: List.generate(
//                                         50, (index) => Text('ok')),
//                                   ),
//
//                                   // getHeightSizedBox(h: 20),
//                                   // Container(
//                                   //   height: 500,
//                                   //   child: TabBarView(
//                                   //       controller: tabController,
//                                   //       children: [ingredients(), recipe()]),
//                                   // )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   CustomButton makingButton({Color? color}) {
//     return CustomButton(
//       onTap: () {},
//       radius: 50,
//       width: 233,
//       color: color == null ? AppColor.kPrimaryColor : color,
//       text: 'Yes, Im making this!',
//     );
//   }
//
//   Widget recipe() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Column(
//               children: List.generate(
//                   3,
//                   (index) => stepContainer(
//                       index: index,
//                       title:
//                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et officia deserunt mollit anim id est laborum.',
//                       image: AppImages.background))),
//           Wrap(
//             children: [
//               Text(
//                 'Enjoy',
//                 style: TextStyle(fontSize: getWidth(20)),
//               ),
//               Text(
//                 '  : )',
//                 style: TextStyle(
//                     fontSize: getWidth(20), fontWeight: FontWeight.w900),
//               )
//             ],
//           ),
//           getHeightSizedBox(h: 40)
//         ],
//       ),
//     );
//   }
//
//   Widget stepContainer(
//       {required int index, required String title, required String image}) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//           horizontal: kDefaultPadding, vertical: kDefaultPadding - 17),
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Text(
//                 'Step ${index + 1}',
//                 style: TextStyle(fontSize: getWidth(20)),
//               ),
//               getHeightSizedBox(h: 10),
//               Container(
//                 height: getWidth(70),
//                 width: getWidth(70),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                         image: AssetImage(image), fit: BoxFit.cover)),
//               ),
//               getHeightSizedBox(h: 12),
//               Container(
//                 height: index == 2 ? 7 : 60,
//                 width: 5,
//                 color: Colors.white,
//               )
//             ],
//           ),
//           getHeightSizedBox(w: kDefaultPadding),
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(fontSize: getWidth(16)),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget ingredients() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: kDefaultPadding + 30),
//             child: Row(
//               children: [
//                 Wrap(
//                   crossAxisAlignment: WrapCrossAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.access_time,
//                       color: AppColor.kPrimaryColor,
//                     ),
//                     getHeightSizedBox(w: 3),
//                     Text(
//                       ' 30 min',
//                       style: TextStyle(
//                           color: AppColor.kPrimaryColor,
//                           fontSize: getWidth(16),
//                           fontWeight: FontWeight.w600),
//                     )
//                   ],
//                 ),
//                 Spacer(),
//                 Wrap(
//                   crossAxisAlignment: WrapCrossAlignment.center,
//                   children: [
//                     Text(
//                       '3 portions',
//                       style: TextStyle(
//                           color: AppColor.kPrimaryColor,
//                           fontSize: getWidth(16),
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                       color: AppColor.kPrimaryColor,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           getHeightSizedBox(h: 25),
//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(4, (index) => itemNut(index: index))),
//           getHeightSizedBox(h: 25),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
//             child: Text(
//               'Things you might not have',
//               style: TextStyle(
//                   fontWeight: FontWeight.w600, fontSize: getWidth(16)),
//             ),
//           ),
//           Column(
//             children: List.generate(4, (index) => checkBoxListTile()),
//           ),
//           getHeightSizedBox(h: 5),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
//             child: Text(
//               'Things you might have',
//               style: TextStyle(
//                   fontWeight: FontWeight.w600, fontSize: getWidth(16)),
//             ),
//           ),
//           getHeightSizedBox(h: 5),
//           Column(
//             children: List.generate(4, (index) => checkBoxListTile()),
//           ),
//           getHeightSizedBox(h: 10),
//           CustomButton(
//               text: '4 items       Add to shopping List',
//               onTap: () {
//                 Get.to(() => ShoppingList());
//               }),
//           getHeightSizedBox(h: 40),
//         ],
//       ),
//     );
//   }
//
//   Widget itemNut({required int index}) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//             border: index == 3
//                 ? Border()
//                 : Border(right: BorderSide(color: Colors.white, width: 1))),
//         child: Column(
//           children: [
//             Text(
//               'Calories',
//               style: TextStyle(fontSize: getWidth(13)),
//             ),
//             getHeightSizedBox(h: 4),
//             Text(
//               '242',
//               style: TextStyle(
//                   fontWeight: FontWeight.w600, fontSize: getWidth(16)),
//             ),
//             getHeightSizedBox(h: 4),
//             Text(
//               'Kcal',
//               style: TextStyle(fontSize: getWidth(13)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget checkBoxListTile() {
//     return GetBuilder(
//       builder: (DishDetailController controller) => Padding(
//         padding: const EdgeInsets.symmetric(
//             vertical: 5, horizontal: kDefaultPadding),
//         child: Row(children: [
//           IconButton(
//             onPressed: () {
//               controller.isCheck = !controller.isCheck;
//             },
//             icon: buildSvgImage(
//               image: controller.isCheck ? AppIcons.check : AppIcons.unCheck,
//               height: 19,
//               width: 19,
//             ),
//           ),
//           getHeightSizedBox(w: 15),
//           Text(
//             'Paneer',
//             style:
//                 TextStyle(fontSize: getWidth(16), fontWeight: FontWeight.w600),
//           ),
//           Spacer(),
//           Text(
//             '500gm',
//             style:
//                 TextStyle(fontSize: getWidth(16), fontWeight: FontWeight.w600),
//           ),
//         ]),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/core/viewmodels/controllers/dishDetailController.dart';
import 'package:whatscooking/ui/screens/drawerMenu/achievements.dart';
import 'package:whatscooking/ui/screens/drawerMenu/bookdiary.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import '../../../globals.dart';

class BookingEventDetailScreen extends StatefulWidget {
  @override
  _BookingEventDetailScreenState createState() =>
      _BookingEventDetailScreenState();
}

class _BookingEventDetailScreenState extends State<BookingEventDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final DishDetailController dishDetailController =
      Get.put(DishDetailController());
  final BaseScreenController baseScreenController =
      Get.find<BaseScreenController>();
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late ScrollController _scrollController;
  late Timer timer;
  var second = 0;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    tabController = TabController(length: dishDetailList.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    print(_height);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: Get.height,
              width: Get.width,
              child: Image.asset(AppImages.background, fit: BoxFit.cover)),
          CustomScrollView(
            shrinkWrap: true,
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverPersistentHeader(
                /// Create Appbar
                delegate: MySliverAppBar(
                    expandedHeight: _height,
                    tabController: tabController,
                    onTap: () {
                      _controller = AnimationController(
                        duration: const Duration(milliseconds: 500),
                        vsync: this,
                      )..forward().whenComplete(() {
                          _controller.dispose();
                        });
                      _animation = Tween<Offset>(
                        begin: const Offset(0.8, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.easeIn,
                      ));
                      dishDetailController.isCheck = true;
                      timer = Timer(Duration(seconds: 5), () {
                        dishDetailController.isCheck = false;
                        timer.cancel();
                      });
                    },
                    scrollController: _scrollController),
                pinned: true,
              ),

              /// Create body
              SliverToBoxAdapter(
                child: Container(
                  height: Get.height -
                      getHeight(90) -
                      getHeight(130) -
                      getHeight(200),
                  decoration: BoxDecoration(color: Colors.black),
                  child: TabBarView(
                    controller: tabController,
                    children: [ingredients(), recipe()],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 110,
            child: SafeArea(
              child: GetBuilder(
                builder: (DishDetailController controller) => controller.isCheck
                    ? SlideTransition(
                        position: _animation,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(BookDiary());
                              },
                              child: Container(
                                height: getWidth(100),
                                width: Get.width - 30,
                                padding: EdgeInsets.fromLTRB(30, 5, 20, 5),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.85),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(18),
                                        bottomLeft: Radius.circular(18))),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            3,
                                            (index) => Padding(
                                                  padding: index == 1
                                                      ? EdgeInsets.only(
                                                          bottom: 10)
                                                      : EdgeInsets.zero,
                                                  child: 2 >= (index + 1)
                                                      ? SvgPicture.asset(
                                                          AppIcons.starCheck)
                                                      : SvgPicture.asset(
                                                          AppIcons.starUncheck),
                                                )),
                                      ),
                                      Text(
                                        'Entry number 145: Butter Paneer',
                                        style: TextStyle(
                                            fontSize: getWidth(20),
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Keep going to maintain your streak!',
                                        style: TextStyle(
                                            fontSize: getWidth(15),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            getHeightSizedBox(h: 12),
                            Container(
                              height: getWidth(100),
                              width: Get.width - 30,
                              padding: EdgeInsets.fromLTRB(30, 5, 20, 5),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.85),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomLeft: Radius.circular(18))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.trophyDish),
                                  getHeightSizedBox(w: 12),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Congratulation!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: getWidth(20)),
                                        ),
                                        Text(
                                          'You earned an Achievement',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: getWidth(16)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print('ok');
                                            Get.to(() => Achievements());
                                          },
                                          child: Text(
                                            'Click here to view ',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: AppColor.kPrimaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: getWidth(16)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.topCenter,
              child: AppLogo(
                height: 90,
                width: 90,
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.topLeft,
              child: FittedBox(
                child: Container(
                  height: 90.0,
                  margin: EdgeInsets.only(left: kDefaultPadding),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(AppIcons.back),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Align(
                alignment: Alignment.topRight,
                child: FittedBox(
                  child: Container(
                      height: 90.0,
                      margin: EdgeInsets.only(right: kDefaultPadding),
                      //color: Colors.red,
                      child: SvgPicture.asset(AppIcons.loveCart)),
                )),
          ),
        ],
      ),
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
                Get.back();
                baseScreenController.selectedIndex = 1;
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
              controller.isCheckBox = !controller.isCheckBox;
            },
            icon: buildSvgImage(
              image: controller.isCheckBox ? AppIcons.check : AppIcons.unCheck,
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

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final DishDetailController dishDetailController =
      Get.put(DishDetailController());

  final double expandedHeight;
  final TabController tabController;
  final Function onTap;
  final ScrollController scrollController;
  MySliverAppBar({
    required this.scrollController,
    required this.onTap,
    required this.tabController,
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Future.delayed(Duration.zero, () {
      if (shrinkOffset > 30 && dishDetailController.isCheck == true) {
        dishDetailController.isCheck = false;
      }
    });

    // print((1 - (2 * (shrinkOffset / expandedHeight))).floorToDouble());
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // height: getHeight(100),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0 >= 1 - (2.2 * (shrinkOffset / expandedHeight))
                          ? 0
                          : 1 - (2.2 * (shrinkOffset / expandedHeight)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 3, 20, 3),
                            decoration: BoxDecoration(
                                color: AppColor.kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 5,
                              children: [
                                Icon(Icons.access_time),
                                Text(
                                  '30m',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.3),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Text(
                              "Mughle Shahi Butter Paneer Masala",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.5,
                                  fontWeight: FontWeight.w700),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0 >= 1 - (2.2 * (shrinkOffset / expandedHeight))
                          ? 1
                          : ((2.2 * (shrinkOffset / expandedHeight))),
                      child: Center(
                          child: CustomButton(
                        onTap: () {},
                        width: 233,
                        height: 60,
                        color: AppColor.kPrimaryColor.withOpacity(0.75),
                        radius: 50,
                        text: "Yes, I'm making this!",
                      )),
                    ),
                  ],
                ),
              ),
              1 - (2.2 * (shrinkOffset / expandedHeight)) <= 0.2
                  ? getHeightSizedBox(h: 10)
                  : SizedBox(),
              Container(
                padding: EdgeInsets.only(top: 30),
                height: 1 - (2.2 * (shrinkOffset / expandedHeight)) <= 0.2
                    ? getHeight(130)
                    : getHeight(195),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    1 - (2.2 * (shrinkOffset / expandedHeight)) <= 0.2
                        ? Container(
                            height: 5,
                            width: 75,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF).withOpacity(0.78),
                                borderRadius: BorderRadius.circular(50)),
                          )
                        : SizedBox(),
                    Visibility(
                      visible:
                          1 - (2.2 * (shrinkOffset / expandedHeight)) <= 0.2
                              ? false
                              : true,
                      replacement: tabs(),
                      child: Opacity(
                        opacity:
                            0 >= 1 - (2.2 * (shrinkOffset / expandedHeight))
                                ? 0
                                : 1 - (2.2 * (shrinkOffset / expandedHeight)),
                        child: CustomButton(
                          onTap: () {
                            if (dishDetailController.isCheck == false &&
                                shrinkOffset < 5) {
                              onTap();
                            }
                          },
                          width: 233,
                          radius: 50,
                          height: 60,
                          text: "Yes, I'm making this!",
                        ),
                      ),
                    ),
                    getHeightSizedBox(h: 25),
                    1 - (2.2 * (shrinkOffset / expandedHeight)) <= 0.2
                        ? SizedBox()
                        : Opacity(
                            opacity: 0 >=
                                    1 - (2.2 * (shrinkOffset / expandedHeight))
                                ? 0
                                : 1 - (2.2 * (shrinkOffset / expandedHeight)),
                            child: tabs2(),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  tabs() {
    return Column(
      children: [
        Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            labelStyle:
                TextStyle(fontSize: getWidth(25), fontWeight: FontWeight.bold),
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
      ],
    );
  }

  tabs2() {
    return Column(
      children: [
        Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            onTap: (v) {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            },
            labelStyle:
                TextStyle(fontSize: getWidth(25), fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Color(0xffA6A6A6),
            labelColor: Color(0xffA6A6A6),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: List.generate(
              dishDetailList.length,
              (index) => Tab(
                text: dishDetailList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;
  @override
  double get minExtent => kToolbarHeight;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
