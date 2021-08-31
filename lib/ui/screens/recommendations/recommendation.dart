import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/recController.dart';
import 'package:whatscooking/ui/screens/dishDetails/dishDetails.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/customDialog.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import 'filterScreen.dart';

class Recommendations extends StatefulWidget {
  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      showCustomDialog(
          context: context, dialogueType: DialogueType.preferenceFillUp);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final RecController recController = Get.put(RecController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (RecController controller) {
        return controller.isSpin
            ? SpinScreen()
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      getHeightSizedBox(h: 10),
                      filterHeader(),
                      getHeightSizedBox(h: 9),
                      Column(
                        children: List.generate(
                            3,
                            (index) => recFoodBox(
                                onTap: () {
                                  Get.to(() => DishDetails());
                                },
                                image: AppImages.recFoodBoxPhoto,
                                title: 'Butter Paneer')),
                      ),
                      getHeightSizedBox(h: 9),
                      GestureDetector(
                        onTap: () {
                          controller.isSpin = true;
                        },
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            buildSvgImage(
                                image: AppIcons.wheel, height: 40, width: 40),
                            Text(
                              'Help me choose',
                              style: TextStyle(
                                  color: AppColor.kPrimaryColor,
                                  fontSize: getWidth(15),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      getHeightSizedBox(h: 25)
                    ],
                  ),
                ),
              );
      },
    );
  }

  Padding filterHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Spacer(
            flex: 4,
          ),
          CustomButton(
            text: 'Aaj Kya Banaye?',
            onTap: () {},
            radius: 50,
            height: 35,
            width: 160,
            fontSize: 14,
          ),
          Spacer(
            flex: 3,
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => FilterScreen());
              },
              child: SvgPicture.asset(AppIcons.filter)),
        ],
      ),
    );
  }
}

class SpinScreen extends StatefulWidget {
  @override
  _SpinScreenState createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen> {
  StreamController<int> streamController = StreamController<int>();
  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (RecController controller) {
        return SingleChildScrollView(
          controller: ScrollController(initialScrollOffset: 0),
          child: Column(
            children: [
              getHeightSizedBox(h: 10),
              Text(
                'Spin the wheel to get your recommendation',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: getWidth(25)),
              ),
              getHeightSizedBox(h: 50),

              buildFortuneWheel(controller),
              getHeightSizedBox(h: 50),

              //Image(image: AssetImage('assets/images/onBoarding/temp.png')),
              CustomButton(
                text: 'Spin',
                onTap: controller.isAnimating
                    ? null
                    : () {
                        setState(() {
                          streamController.add(Random().nextInt(3));
                        });
                      },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildFortuneWheel(RecController controller) {
    List list = [
      AppImages.menuBackground,
      AppImages.background,
      AppImages.onBoardingBackGround
    ];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: AppColor.kPrimaryColor, shape: BoxShape.circle),
          child: SizedBox(
            height: 300,
            child: FortuneWheel(
              selected: streamController.stream,
              animateFirst: false,
              indicators: [],
              styleStrategy: UniformStyleStrategy(
                  borderColor: AppColor.kPrimaryColor, borderWidth: 5),
              items: [
                for (var item in list)
                  FortuneItem(
                      child: Container(
                    color: Colors.white,
                  ))
              ],
              onAnimationStart: () {
                controller.isAnimating = true;
              },
              onAnimationEnd: () {
                controller.isAnimating = false;
              },
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: -11,
          child: Center(
            child: ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  height: 57,
                  width: 60,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

Widget recFoodBox(
    {required String image,
    Function()? onTap,
    required String title,
    bool isNotWeight = false}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: Container(
        height: 165,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: isNotWeight ? 40 : 50,
          width: Get.width,
          color: Colors.black.withOpacity(0.20),
          child: Center(
            child: Row(
              children: [
                getHeightSizedBox(w: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: isNotWeight ? null : FontWeight.bold,
                    fontSize: getWidth(isNotWeight ? 20 : 25),
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
