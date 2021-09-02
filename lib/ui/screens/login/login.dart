import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/appFunctions.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/loginController.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                disposeKeyboard();
              },
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage(
                          AppImages.loginBackground1,
                        ),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding + 5),
                  child: Column(
                    children: [
                      getHeightSizedBox(h: Get.height / 5),
                      AppLogo(),
                      getHeightSizedBox(h: 60),
                      Text(
                        'Login/Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getWidth(20)),
                      ),
                      getHeightSizedBox(h: 30),
                      BuildFields(),
                      getHeightSizedBox(h: 23),
                      Text(
                        'OR',
                        style: TextStyle(
                            fontSize: getWidth(20),
                            fontWeight: FontWeight.w600,
                            color: AppColor.kPrimaryColor),
                      ),
                      getHeightSizedBox(h: 23),
                      Row(
                        children: [
                          buildImage(
                              image: AppIcons.google,
                              height: 50,
                              width: 155,
                              onTap: () {
                                disposeKeyboard();
                              }),
                          Spacer(),
                          buildImage(
                              image: AppIcons.facebook,
                              height: 50,
                              width: 155,
                              onTap: () {
                                disposeKeyboard();
                              }),
                        ],
                      ),
                      getHeightSizedBox(h: 10),
                      GestureDetector(
                        onTap: () {
                          disposeKeyboard();
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login via',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w600),
                              ),
                              buildImage(
                                  image: AppIcons.trueCaller,
                                  height: 26,
                                  width: 108)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildFields extends StatefulWidget {
  @override
  _BuildFieldsState createState() => _BuildFieldsState();
}

class _BuildFieldsState extends State<BuildFields>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      lowerBound: 0,
      upperBound: 1,
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  final LoginController loginController = Get.put(LoginController());

  final TextEditingController mobileNumber = TextEditingController();

  final TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (LoginController controller) => Column(
        children: [
          CustomTextField(
            hintText: 'Enter Mobile Number',
            suffixText: 'Send OTP',
            controller: mobileNumber,
            maxLength: 10,
            textInputType: TextInputType.phone,
            onTap: () {
              controller.otpFieldShow = true;
            },
          ),
          controller.otpFieldShow
              ? FadeTransition(
                  opacity: _animation,
                  child: Column(
                    children: [
                      getHeightSizedBox(h: 12),
                      CustomTextField(
                        hintText: 'Enter OTP',
                        suffixText: 'Re Send OTP',
                        onTap: () {
                          Get.back();
                        },
                        controller: otp,
                        textInputType: TextInputType.phone,
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    print('dispose');
    _controller.dispose();
    super.dispose();
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String hintText;
  final String suffixText;
  final int? maxLength;
  final Function()? onTap;
  CustomTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    required this.hintText,
    required this.suffixText,
    this.onTap,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Container(
        height: 50,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: textInputType,
                textInputAction: TextInputAction.done,
                maxLength: maxLength,
                buildCounter: (BuildContext context,
                        {required int currentLength,
                        required bool isFocused,
                        required int? maxLength}) =>
                    null,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: hintText),
              ),
            ),
            getHeightSizedBox(w: 5),
            TextButton(
              onPressed: onTap,
              child: Text(
                suffixText,
                style: TextStyle(
                    fontSize: getWidth(15), color: AppColor.kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
