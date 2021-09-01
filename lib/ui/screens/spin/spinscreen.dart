import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/recController.dart';
import 'package:whatscooking/ui/shared/customButton.dart';

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
