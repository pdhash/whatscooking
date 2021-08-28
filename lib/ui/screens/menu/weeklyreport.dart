import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:whatscooking/core/constant/appSettings.dart';
import 'package:whatscooking/core/enums.dart';
import 'package:whatscooking/core/utils/config.dart';
import 'package:whatscooking/ui/shared/customAppBar.dart';

class WeeklyReport extends StatelessWidget {
  final List list = ['Calories', 'Protein', 'Carbs'];
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
            getHeightSizedBox(h: 30),
            Column(
                children: List.generate(
              3,
              (index) => Column(
                children: [
                  Text(
                    list[index],
                    style: TextStyle(fontSize: getWidth(20)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    height: 150,
                    child: LineChart(
                      globalData(),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

LineChartData globalData() {
  return LineChartData(
    clipData: FlClipData.horizontal(),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.white.withOpacity(0.7),
          strokeWidth: 0,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.white.withOpacity(0.7),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        interval: 1,
        getTextStyles: (context, value) =>
            TextStyle(color: Colors.white, fontSize: getWidth(20)),
        getTitles: (value) {
          print(value);
          switch (value.toInt()) {
            case 0:
              return 'M';
            case 1:
              return 'T';
            case 2:
              return 'W';
            case 3:
              return 'T';
            case 4:
              return 'F';
            case 5:
              return 'S';
            case 6:
              return 'S';
          }
          return '';
        },
        margin: 20,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => TextStyle(
          color: Colors.white,
          fontSize: getWidth(12),
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '0';
            case 2:
              return '1500';
            case 4:
              return '3000';
          }
          return '';
        },
        reservedSize: 30,
        margin: 18,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.symmetric(
            vertical:
                BorderSide(color: Colors.white.withOpacity(0.7), width: 1))),
    lineTouchData: LineTouchData(enabled: false),
    minX: 0,
    maxX: 6,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        show: true,
        spots: [
          FlSpot(0, 1),
          FlSpot(2.6, 1),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        // belowBarData: BarAreaData(
        //   show: true,
        //   colors:
        //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        // ),
      ),
    ],
  );
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
