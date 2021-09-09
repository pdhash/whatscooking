import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';
import 'package:whatscooking/ui/shared/customTextfield.dart';

class Notifications extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () => Get.back(),
          onActionButtonTap: () => Get.to(() => Notifications())),
      body: Column(
        children: [
          getHeightSizedBox(h: 15),
          header(),
          getHeightSizedBox(h: 20),
          SearchHeader(search: search),
          getHeightSizedBox(h: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  4,
                  (index) => notificationBox(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding notificationBox() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: getWidth(110),
          color: Colors.black,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 5,
                color: AppColor.kPrimaryColor,
              ),
              getHeightSizedBox(w: 12),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '08 April',
                        style: TextStyle(
                            color: AppColor.notify1,
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w600),
                      ),
                      getHeightSizedBox(h: 2),
                      Text(
                        'Lorem ipsum dolor sit amet, consetetur.',
                        style: TextStyle(
                            color: AppColor.kPrimaryColor,
                            fontSize: getWidth(15),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getWidth(13),
                            height: 1.8,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text header() {
    return Text(
      'Notifications',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(26)),
    );
  }
}

class SearchHeader extends StatelessWidget {
  final TextEditingController search;

  const SearchHeader({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField2(
              controller: search,
              width: 145,
              height: 40,
              hintText: 'Search',
              prefixWidget: Icon(
                Icons.search,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Mark All As Read',
              style: TextStyle(
                  color: AppColor.kPrimaryColor,
                  fontSize: getWidth(15),
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
