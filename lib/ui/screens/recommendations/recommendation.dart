import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/recController.dart';
import 'package:whatscooking/ui/screens/dishDetails/dishDetails.dart';
import 'package:whatscooking/ui/shared/customButton.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

class Recommendations extends StatelessWidget {
  final RecController recController = Get.put(RecController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (RecController controller) {
      Widget screenTwo() {
        return SingleChildScrollView(
          child: Column(
            children: [
              getHeightSizedBox(h: 10),
              Text(
                'Spin the wheel to get your recommendation',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: getWidth(25)),
              ),
              Container(
                height: 500,
                //   child: FortuneWheel(
                //     selected: Stream.value(0),
                //     // physics: PanPhysics(),
                //     duration: Duration(seconds: 5),
                //     items: [
                //       FortuneItem(
                //         child: Text('A'),
                //         // style: FortuneItemStyle(
                //         //   color: Colors.red,
                //         //   borderColor: Colors.green,
                //         //   borderWidth: 3,
                //         // ),
                //       ),
                //       FortuneItem(child: Text('B')),
                //       FortuneItem(child: Text('B')),
                //     ],
                //   ),
              ),
              CustomButton(
                  text: 'Spin',
                  onTap: () {
                    Get.to(() => DishDetails());
                  })
            ],
          ),
        );
      }

      SingleChildScrollView screenOne() {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                        'Lets Begin!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getWidth(25)),
                      ),
                      Spacer(),
                      buildSvgImage(
                          image: AppIcons.filter, height: 17, width: 18),
                    ],
                  ),
                ),
                Text(
                  'We suggest 3 recipes for every meal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(15)),
                ),
                getHeightSizedBox(h: 7),
                CustomButton(
                  text: 'Show me suggestions!',
                  onTap: () {},
                  radius: 50,
                  height: 36,
                  width: 211,
                  fontSize: 14,
                ),
                getHeightSizedBox(h: 9),
                Column(
                  children: List.generate(
                      3,
                      (index) => recFoodBox(
                          image: AppImages.recFoodBoxPhoto,
                          title: 'Butter Paneer')),
                ),
                getHeightSizedBox(h: 9),
                GestureDetector(
                  onTap: () {
                    controller.isSpin = true;
                  },
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      buildSvgImage(
                          image: AppIcons.wheel, height: 40, width: 40),
                      Text(
                        'Help me choose',
                        style: TextStyle(
                            color: AppColor.kPrimaryColor,
                            fontSize: getWidth(15),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                getHeightSizedBox(h: 25)
              ],
            ),
          ),
        );
      }

      return controller.isSpin ? screenTwo() : screenOne();
    });
  }
}

Widget recFoodBox(
    {required String image, Function()? onTap, required String title}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: Container(
        height: 165,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 50,
          width: Get.width,
          color: Colors.black.withOpacity(0.20),
          child: Center(
            child: Row(
              children: [
                getHeightSizedBox(w: 20),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(25)),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
