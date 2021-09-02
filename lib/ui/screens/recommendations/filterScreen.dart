import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatscooking/core/constant/appColors.dart';
import 'package:whatscooking/core/constant/appIcons.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/core/viewmodels/controllers/filterController.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () {
            Get.back();
          }),
      body: Column(
        children: [
          getHeightSizedBox(h: 20),
          FilterOption(),
          getHeightSizedBox(h: 20),
          Expanded(child: TabOptions()),
          SafeArea(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 40,
                child: Text(
                  'Apply Filters',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.kPrimaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TabOptions extends StatefulWidget {
  @override
  _TabOptionsState createState() => _TabOptionsState();
}

class _TabOptionsState extends State<TabOptions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List list = ['Meal', 'Cuisines', 'Type', 'Prep time'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            height: 35,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.22),
              indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.only(left: 15, right: 19)),
              tabs: [
                for (var tabs in list)
                  Tab(
                    child: Text(
                      tabs,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getWidth(20),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        getHeightSizedBox(h: 15),
        Expanded(child: buildTabBarView()),
      ],
    );
  }

  Widget buildTabBarView() {
    List list = [
      'Any',
      'Gujarati',
      'Rajasthani',
      'Punjabi',
      'Continental',
      'Maharashtrian',
      'Italian',
      'Mexican'
    ];
    return TabBarView(
      controller: _tabController,
      children: List.generate(
        4,
        (index) => ListView(
          padding: EdgeInsets.only(left: 12),
          children: List.generate(
            list.length,
            (index) => ListTile(
              title: Text(
                list[index],
                style: TextStyle(fontSize: getWidth(20), color: Colors.white),
              ),
              trailing: IconButton(
                icon: SvgPicture.asset(AppIcons.check),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: kDefaultPadding),
      clipBehavior: Clip.none,
      child: Row(
        children: List.generate(4, (index) => filterContainer()),
      ),
    );
  }

  filterContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Color(0xff4A4A4A), borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Row(
          children: [
            Text(
              'Lunch',
              style: TextStyle(
                  fontSize: getWidth(12), fontWeight: FontWeight.w600),
            ),
            getHeightSizedBox(w: 20),
            GestureDetector(
              child: Icon(
                Icons.close,
                size: 16,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
