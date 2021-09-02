import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customDialog.dart';
import 'package:whatscooking/ui/shared/doubleTaptoback.dart';

import '../../globals.dart';
import 'nav.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      showCustomDialog(
          context: context, dialogueType: DialogueType.preferenceFillUp);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
      child: Scaffold(
        appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.none,
          color: Colors.transparent,
        ),
        body: GetBuilder(
          builder: (BaseScreenController controller) => IndexedStack(
            index: controller.selectedIndex,
            children: navigationList,
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
