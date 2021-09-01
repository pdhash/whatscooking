import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/ui/screens/drawer.dart';
import 'package:whatscooking/ui/screens/profile/profile.dart';
import 'package:whatscooking/ui/screens/spin/spinscreen.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

import 'feed/feed.dart';
import 'homee/recommendation.dart';
import 'mealPlan/calendar.dart';
import 'nav.dart';

class BaseScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final List<Widget> screens = [
    Home(),
    Feed(),
    SpinScreen(),
    MealPlan(),
    MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.drawer,
          color: Colors.transparent,
          onLeadingButtonTap: () {
            print('ook');
            globalKey.currentState!.openDrawer();
          }),
      drawer: CustomDrawer(),
      body: GetBuilder(
        builder: (BaseScreenController controller) => IndexedStack(
          index: controller.selectedIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
