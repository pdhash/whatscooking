import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/shoppingListController.dart';
import 'package:whatscooking/ui/shared/customButton.dart';

class ShoppingList extends StatelessWidget {
  final ShoppingListController shoppingListController =
      Get.put(ShoppingListController());
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
            builder: (ShoppingListController controller) => controller.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding + 5),
                    child: Column(
                      children: [
                        Text(
                          'Your Shopping list is visible here',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: getWidth(20)),
                        ),
                        getHeightSizedBox(h: 45),
                        Text(
                          'You can directly add items to this cart from the meal planned and the ingredients page of every dish',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: getWidth(20)),
                        ),
                        getHeightSizedBox(h: 50),
                        Wrap(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.isEmpty = false;
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: getWidth(20)),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 2),
                        child: Column(
                          children: List.generate(
                              4,
                              (index) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Paneer',
                                        style:
                                            TextStyle(fontSize: getWidth(20)),
                                      ),
                                      DropdownButton<String>(
                                        underline: SizedBox(),
                                        items: ['vb', 'dfgg']
                                            .map(
                                              (e) => DropdownMenuItem<String>(
                                                value: '',
                                                child: Text(
                                                  e,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: getWidth(14)),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        hint: Text(
                                          '500gm ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: getWidth(19)),
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                        onChanged: (val) {},
                                      )
                                    ],
                                  )),
                        ),
                      ),
                      getHeightSizedBox(h: 30),
                      buildCustomButton(
                          title: 'WhatsApp to',
                          onTap: () {},
                          image: AppIcons.whatsapp),
                      getHeightSizedBox(h: 15),
                      buildCustomButton(
                          title: 'Order on BigBasket',
                          onTap: () {},
                          image: AppIcons.bigBasket),
                      getHeightSizedBox(h: 15),
                      buildCustomButton(
                          title: 'Order on Amazon',
                          onTap: () {},
                          image: AppIcons.amazon),
                      getHeightSizedBox(h: 40),
                      Text(
                        'Go to Meal Plan',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontSize: getWidth(20)),
                      ),
                      getHeightSizedBox(h: 50),
                    ],
                  ),
          )
        ],
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
              style: TextStyle(
                  fontSize: getWidth(16), fontWeight: FontWeight.w600),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
        onTap: onTap);
  }
}
