import 'package:flutter/material.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/extension/appBarExtension.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

PreferredSizeWidget appBar(
    {required AppBarActionButtonType appBarActionButtonType,
    required AppBarLeadingButtonType appBarLeadingButtonType,
    Function()? onLeadingButtonTap,
    Function()? onActionButtonTap,
    Color color = Colors.white12}) {
  return PreferredSize(
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appBarLeadingButtonType.add(onLeadingButtonTap),
            Center(
              child: AppLogo(
                height: 80,
                width: 80,
                color: color,
              ),
            ),
            appBarActionButtonType.add(onActionButtonTap)
          ],
        ),
      ),
    ),
    preferredSize: Size.fromHeight(90),
  );
}
