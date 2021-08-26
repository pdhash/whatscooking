import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

class SignatureDishes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
            appBarActionButtonType: AppBarActionButtonType.notification,
            appBarLeadingButtonType: AppBarLeadingButtonType.back,
            onLeadingButtonTap: () => Get.back()),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 6,
          itemBuilder: (context, index) => Container(),
        ));
  }
}
