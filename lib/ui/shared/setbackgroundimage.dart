import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/utils/config.dart';

class SetBackGround extends StatelessWidget {
  final String image;
  final Widget? child;

  const SetBackGround({Key? key, required this.image, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppImages.onBoardingBackGround,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        Column(
          children: [
            Expanded(
              flex: 1,
              child: SafeArea(
                  child:
                      Align(alignment: Alignment.topCenter, child: SizedBox())),
            ),
            Expanded(flex: 1, child: child as Widget),
          ],
        )
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  AppLogo(
      {Key? key,
      this.height = 145,
      this.width = 145,
      this.color = AppColor.kLogoBackgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getWidth(height as double),
      width: getWidth(width as double),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: BackdropFilter(
          filter: new ImageFilter.blur(
            sigmaX: 7.0,
            sigmaY: 7.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: getWidth(height as double),
              width: getWidth(width as double),
              decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                AppImages.onBoardingLogo,
              ))),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSvgImage({
  required String image,
  required double height,
  required double width,
  Color? color,
}) {
  return Container(
    //  color: Colors.green,
    height: getWidth(height),
    width: getWidth(width),
    child: Center(
      child: SvgPicture.asset(
        image,
        color: color,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget buildImage(
    {required String image,
    required double height,
    required double width,
    Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      //  color: Colors.green,
      height: getWidth(height),
      width: getWidth(width),
      decoration: BoxDecoration(),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    ),
  );
}
