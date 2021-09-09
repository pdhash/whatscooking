import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/basescreenContoller.dart';
import 'package:whatscooking/core/viewmodels/controllers/shoppingListController.dart';
import 'package:whatscooking/globals.dart';
import 'package:whatscooking/ui/shared/customButton.dart';

class ShoppingList extends StatelessWidget {
  late final ShoppingListController shoppingListController;
  late final BaseScreenController baseScreenController;

  ShoppingList() {
    print("ShoppingList......................");
    shoppingListController = Get.put(ShoppingListController());

    baseScreenController = Get.find<BaseScreenController>();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getHeightSizedBox(h: 20),
          Text(
            'Shopping list',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(25)),
          ),
          getHeightSizedBox(h: 45),
          GetBuilder(
            builder: (ShoppingListController controller) =>
                controller.isEmpty ? shoppingItemView2() : shoppingItemView(),
            // controller.isEmpty ? Text('2') : Text('1'),
          )
        ],
      ),
    );
  }

  Padding shoppingItemView2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding + 5),
      child: Column(
        children: [
          Text(
            'Your Shopping list is visible here',
            style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: getWidth(20)),
          ),
          getHeightSizedBox(h: 45),
          Text(
            'You can directly add items to this cart from the meal planned and the ingredients page of every dish',
            style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: getWidth(20)),
          ),
          getHeightSizedBox(h: 50),
          Wrap(
            children: [
              GestureDetector(
                onTap: () {
                  baseScreenController.selectedIndex = 3;
                  shoppingListController.isEmpty = false;
                },
                child: Text(
                  'Go to Meal Plan',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColor.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: getWidth(20)),
                ),
              ),
              Text(
                ' to get started!',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: getWidth(20)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Column shoppingItemView() {
    return Column(
      children: [
        GetBuilder(
          builder: (ShoppingListController controller) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            child: Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paneer',
                        style: TextStyle(fontSize: getWidth(20)),
                      ),
                      GestureDetector(
                        onTap: () {
                          dropDownButton();
                        },
                        child: Row(
                          children: [
                            Text(
                              '${weightList[controller.currentWeight]}gm ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: getWidth(19)),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        getHeightSizedBox(h: 30),
        buildCustomButton(
            title: 'WhatsApp to', onTap: () {}, image: AppIcons.whatsapp),
        getHeightSizedBox(h: 15),
        buildCustomButton(
            title: 'Order on BigBasket',
            onTap: () {},
            image: AppIcons.bigBasket),
        getHeightSizedBox(h: 15),
        buildCustomButton(
            title: 'Order on Amazon', onTap: () {}, image: AppIcons.amazon),
        getHeightSizedBox(h: 40),
        GestureDetector(
          child: Text(
            'Go to Meal Plan',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                fontSize: getWidth(20)),
          ),
          onTap: () {
            baseScreenController.selectedIndex = 3;
          },
        ),
        getHeightSizedBox(h: 50),
      ],
    );
  }

  dropDownButton() {
    showCupertinoModalPopup(
      context: Get.context as BuildContext,
      builder: (_) => SizedBox(
        height: 200,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 30,
          scrollController: FixedExtentScrollController(
              initialItem: shoppingListController.currentWeight),
          children: List.generate(
              weightList.length, (index) => Text(weightList[index])),
          onSelectedItemChanged: (value) {
            shoppingListController.currentWeight = value;
          },
        ),
      ),
    );
  }

  CustomButton buildCustomButton({
    required String title,
    Function()? onTap,
    required String image,
  }) {
    return CustomButton(
      text: '',
      widget: Row(
        children: [
          Spacer(),
          SvgPicture.asset(image),
          Spacer(),
          Text(
            title,
            style:
                TextStyle(fontSize: getWidth(16), fontWeight: FontWeight.w600),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
