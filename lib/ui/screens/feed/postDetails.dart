import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

import 'feed.dart';

class PostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () {
            Get.back();
          }),
      body: PostView(),
    );
  }
}
