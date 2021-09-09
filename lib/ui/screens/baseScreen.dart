import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/doubleTaptoback.dart';

import '../../globals.dart';
import 'nav.dart';
import 'notification/notificationScreen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    print("BaseScreen......Build");
    return DoubleBackToCloseApp(
      child: Stack(
        children: [
          Scaffold(
            appBar: appBar(
                appBarActionButtonType: AppBarActionButtonType.notification,
                appBarLeadingButtonType: AppBarLeadingButtonType.none,
                color: Colors.transparent,
                onActionButtonTap: () => Get.to(() => Notifications())),
            body: GetBuilder(
              builder: (BaseScreenController controller) => IndexedStack(
                index: controller.selectedIndex,
                children: navigationList,
              ),
            ),
            bottomNavigationBar: BottomBar(),
          ),
        ],
      ),
    );
  }
}
