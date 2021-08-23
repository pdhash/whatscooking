import 'package:flutter/material.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/utils/config.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final double width;
  final double height;
  final double padding;
  final double fontSize;
  final double? radius;
  final Color color;

  CustomButton({
    required this.text,
    required this.onTap,
    this.width = 0,
    this.padding = 30,
    this.radius = 15,
    this.height = 50,
    this.fontSize = 16,
    this.color = AppColor.kPrimaryColor,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.padding),
        width: widget.width == 0 ? double.infinity : getWidth(widget.width),
        height: getWidth(widget.height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.radius as double),
          ),
          color: widget.color,
        ),
        alignment: Alignment.center,
        child: Center(
            child: Text(widget.text,
                style: TextStyle(
                    fontSize: getWidth(widget.fontSize),
                    fontWeight: FontWeight.w600))),
      ),
      // ),
    );
  }
}
