import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/browseController.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

class Browse extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  final BrowseController browseController = Get.put(BrowseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          onLeadingButtonTap: () {
            Get.back();
          },
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          appBarActionButtonType: AppBarActionButtonType.notification),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            getHeightSizedBox(h: 5),
            Row(
              children: [
                Text(
                  'Browse',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                ),
                Spacer(),
                buildTextField()
              ],
            ),
            getHeightSizedBox(h: 25),
            buildRow1(),
            getHeightSizedBox(h: 20),
            buildRow2(),
            getHeightSizedBox(h: 20),
          ],
        ),
      ),
    );
  }

  Widget buildRow2() {
    return GetBuilder(
      builder: (BrowseController controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          browsList2.length,
          (index) => GestureDetector(
            onTap: () {
              controller.timeSelected = index;
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.access_time,
                  color: index == controller.timeSelected
                      ? AppColor.kPrimaryColor
                      : Colors.white,
                ),
                getHeightSizedBox(w: 5),
                Text(
                  browsList2[index],
                  style: TextStyle(
                      fontSize: getWidth(18),
                      color: index == controller.timeSelected
                          ? AppColor.kPrimaryColor
                          : Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow1() {
    return GetBuilder(
      builder: (BrowseController controller) => Row(
        children: List.generate(
            browsList1.length,
            (index) => Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      controller.selected = index;
                    },
                    child: Text(
                      browsList1[index],
                      style: TextStyle(
                          fontSize: getWidth(18),
                          color: index == controller.selected
                              ? AppColor.kPrimaryColor
                              : Colors.white),
                    ),
                  )),
                  decoration: BoxDecoration(
                      border: index == 2
                          ? Border()
                          : Border(
                              right:
                                  BorderSide(color: Colors.white, width: 1))),
                ))),
      ),
    );
  }

  Container buildTextField() {
    return Container(
      height: 40,
      width: 185,
      child: Center(
        child: TextFormField(
          controller: search,
          style: TextStyle(color: Colors.white),
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white54),
            prefixIconConstraints: BoxConstraints.tight(Size.fromRadius(15)),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

List browsList1 = ['Breakfast', 'Lunch', 'Dinner'];
List browsList2 = ['10 min', '30 min', '1 hour'];
