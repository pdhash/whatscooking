import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

class WeeklyReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          appBarActionButtonType: AppBarActionButtonType.notification,
          appBarLeadingButtonType: AppBarLeadingButtonType.back,
          onLeadingButtonTap: () => Get.back()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Weekly Report',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: getWidth(26)),
            ),
            getHeightSizedBox(h: 20),
            Text(
              'Averages',
              style: TextStyle(fontSize: getWidth(20)),
            ),
            getHeightSizedBox(h: 20),

            ProgressBar(),
            // Center(
            //   child: SfCartesianChart(
            //       primaryXAxis: NumericAxis(),
            //       // Chart title
            //       title: ChartTitle(text: 'Half yearly sales analysis'),
            //       // Enable legend
            //       // legend: Legend(isVisible: true),
            //       // Enable tooltip
            //       //  tooltipBehavior: TooltipBehavior(enable: true),
            //       series: <ChartSeries<_SalesData, String>>[
            //         SplineAreaSeries(
            //             dataSource: data,
            //             xValueMapper: (_SalesData sales, _) => sales.year,
            //             yValueMapper: (_SalesData sales, _) => sales.sales)
            //         // LineSeries<_SalesData, String>(
            //         //     dataSource: data,
            //         //     xValueMapper: (_SalesData sales, _) => sales.year,
            //         //     yValueMapper: (_SalesData sales, _) => sales.year,
            //         //     name: 'Sales',
            //         //     // Enable data label
            //         //     dataLabelSettings: DataLabelSettings(isVisible: false))
            //       ]),
            // ),
          ],
        ),
      ),
    );
  }
}

List<_SalesData> data = [
  _SalesData('Jan', '35'),
  _SalesData('Feb', '28'),
];

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final String sales;
}

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularPercentIndicator(
            radius: 88.0,
            lineWidth: 7.0,
            //animation: true,
            percent: 0.8,
            center: Text(
              '2520',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Calories",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Color(0xffFFAA00),
            backgroundWidth: 2.5,
            backgroundColor: Color(0xff707070),
          ),
          CircularPercentIndicator(
            radius: 88.0,
            lineWidth: 7.0,
            //animation: true,
            percent: 0.7,
            center: Text(
              '3457',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Protein",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Color(0xffFF5042),
            backgroundWidth: 2.5,
            backgroundColor: Color(0xff707070),
          ),
          CircularPercentIndicator(
            radius: 88.0,
            lineWidth: 7.0,
            //animation: true,
            percent: 0.6,
            center: Text(
              '3446',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Carbs",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Color(0xff00DAFD),
            backgroundWidth: 2.5,
            backgroundColor: Color(0xff707070),
          ),
        ],
      ),
    );
  }
}
