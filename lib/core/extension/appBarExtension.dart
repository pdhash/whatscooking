import 'package:flutter/material.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

import '../enums.dart';

extension AppbarLeadingButtonExtension on AppBarLeadingButtonType {
  Widget add(Function()? func) {
    switch (this) {
      case AppBarLeadingButtonType.back:
        return IconButton(
          onPressed: func,
          icon: buildSvgImage(image: AppIcons.back, height: 15, width: 21),
        );
      case AppBarLeadingButtonType.menu:
        return IconButton(
          onPressed: func,
          icon: buildSvgImage(image: AppIcons.menu, height: 16, width: 24),
        );
    }
  }
}

extension AppbarActionButtonExtension on AppBarActionButtonType {
  Widget add(Function()? func) {
    switch (this) {
      case AppBarActionButtonType.notification:
        return IconButton(
          onPressed: func,
          icon: buildSvgImage(
              image: AppIcons.notification, height: 22, width: 21),
        );
      case AppBarActionButtonType.like:
        return IconButton(
          onPressed: func,
          icon: buildSvgImage(image: AppIcons.loveCart, height: 23, width: 26),
        );
    }
  }
}
