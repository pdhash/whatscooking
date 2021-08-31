import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appImages.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/screens/home/addPost.dart';
import 'package:whatscooking/ui/shared/setbackgroundimage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getHeightSizedBox(h: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Feed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getWidth(25),
                      color: Colors.white),
                ),
              ),
              Positioned(
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Get.to(() => AddPost());
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white60,
                    size: getWidth(30),
                  ),
                ),
              ),
            ],
          ),
          getHeightSizedBox(h: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Text(
                  'Share what you made with your loved ones',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: getWidth(16)),
                ),
                getHeightSizedBox(h: 12),
                Row(
                  children: [
                    Expanded(child: buildLink('www.aajkyabanaye.com/jane')),
                    getHeightSizedBox(w: 7),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 25,
                        width: 64,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'COPY',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          getHeightSizedBox(h: 20),
          PostView(),
        ],
      ),
    );
  }
}

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  buildCircleProfile(
                      image: AppImages.background, height: 32, width: 32),
                  getHeightSizedBox(w: 15),
                  Text(
                    'Jane Doe',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: getWidth(20)),
                  ),
                  Spacer(),
                  Text(
                    'Follow',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getWidth(20),
                        color: AppColor.kPrimaryColor),
                  ),
                ],
              ),
              getHeightSizedBox(h: 15),
              Text(
                'Brownie with almonds and melted chocolate',
                style: TextStyle(fontSize: getWidth(20)),
              ),
              getHeightSizedBox(h: 10),
              Container(
                height: getHeight(350),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(AppImages.background),
                        fit: BoxFit.cover)),
              ),
              getHeightSizedBox(h: 20),
              Row(
                children: [
                  getHeightSizedBox(w: 5),
                  GestureDetector(
                    onTap: () {},
                    child: buildSvgImage(
                        image: AppIcons.loveCart, height: 23, width: 26),
                  ),
                  getHeightSizedBox(w: 15),
                  GestureDetector(
                    onTap: () {},
                    child: buildSvgImage(
                        image: AppIcons.comment, height: 23, width: 25),
                  ),
                  getHeightSizedBox(w: 15),
                  GestureDetector(
                    onTap: () {},
                    child: buildSvgImage(
                        image: AppIcons.share, height: 23, width: 19),
                  ),
                ],
              ),
              getHeightSizedBox(h: 25),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCircleProfile(
    {required String image, required double height, required double width}) {
  return Container(
    height: getWidth(height),
    width: getWidth(width),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
  );
}

Widget buildLink(String link) {
  return GestureDetector(
    onTap: () async {
      if (await canLaunch('https://$link')) {
        await launch(
          'https://$link',
        );
      } else {
        throw 'could not lunch';
      }
    },
    child: Text(
      'https://$link',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: getWidth(15),
          color: AppColor.kPrimaryColor,
          decoration: TextDecoration.underline),
    ),
  );
}
