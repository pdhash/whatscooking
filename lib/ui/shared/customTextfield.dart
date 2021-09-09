import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? textInputType;
  final double width;
  final double height;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool giveSpace;
  final int? length;
  final int? minLines;
  final int? maxLines;
  final Widget? suffix;

  const CustomTextField2(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.textInputType,
      this.width = 0,
      this.height = 50,
      this.prefixWidget,
      this.suffixWidget,
      this.giveSpace = false,
      this.length,
      this.minLines,
      this.maxLines,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == 50 ? 50 : height,
      width: width == 0 ? Get.width : width,
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          style: TextStyle(color: Colors.white),
          textCapitalization: TextCapitalization.sentences,
          maxLength: length,
          maxLines: maxLines,
          minLines: minLines,
          buildCounter: (BuildContext context,
                  {required int currentLength,
                  required bool isFocused,
                  required int? maxLength}) =>
              null,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white54),
              prefixIconConstraints:
                  giveSpace ? null : BoxConstraints.tight(Size.fromRadius(15)),
              suffixIconConstraints:
                  giveSpace ? null : BoxConstraints.tight(Size.fromRadius(15)),
              prefixIcon: prefixWidget,
              suffix: suffix,
              suffixIcon: suffixWidget),
        ),
      ),
    );
  }
}
