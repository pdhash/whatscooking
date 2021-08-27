import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/screens/menu/browse.dart';
import 'package:whatscooking/ui/shared/customButton.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add button to go to browse page',
                style: TextStyle(fontSize: getWidth(14)),
              ),
            ),
            getHeightSizedBox(h: 10),
            Row(
              children: [
                Spacer(
                  flex: 3,
                ),
                Text(
                  'Meal Plan ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                ),
                Icon(
                  Icons.info_outline,
                  color: Color(0xff8B8B8B),
                  size: 20,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  'Reset',
                  style: TextStyle(
                      color: AppColor.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: getWidth(14)),
                ),
              ],
            ),
            getHeightSizedBox(h: 25),
            Text(
              'Choose intervals',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: getWidth(20)),
            ),
            getHeightSizedBox(h: 20),
            intervalsColumn(),
            getHeightSizedBox(h: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
                getHeightSizedBox(w: 20),
                Text(
                  'May 31- June 6',
                  style: TextStyle(fontSize: getWidth(16)),
                ),
                getHeightSizedBox(w: 20),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            ),
            getHeightSizedBox(h: 20),
            Column(
              children: List.generate(
                  7,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Row(
                          children: [
                            Container(
                              height: getWidth(43),
                              width: getWidth(70),
                              decoration: BoxDecoration(
                                  color: Color(0xff4A4A4A),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  'Day ${index + 1}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: getWidth(12)),
                                ),
                              ),
                            ),
                            getHeightSizedBox(w: 18),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    3,
                                    (index) => Container(
                                          height: getWidth(70),
                                          width: getWidth(70),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Text(
                                              browsList1[index],
                                              style: TextStyle(
                                                  fontSize: getWidth(12),
                                                  color: Color(0xffAEAEAE),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )),
                              ),
                            )
                          ],
                        ),
                      )),
            ),
            getHeightSizedBox(h: 25),
            CustomButton(
              text: 'Add Ingredietns to Shopping List',
              onTap: () {},
              padding: 0,
            ),
            getHeightSizedBox(h: 45),
          ],
        ),
      ),
    );
  }

  Column intervalsColumn() {
    return Column(
      children: List.generate(
        3,
        (index) => GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: Get.width,
            margin: EdgeInsets.only(bottom: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff4A4A4A)),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Every 2 days',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: getWidth(12)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
