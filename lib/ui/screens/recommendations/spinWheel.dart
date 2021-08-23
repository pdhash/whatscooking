// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
// import 'package:whatscooking/core/enums.dart';
// import 'package:whatscooking/core/utils/config.dart';
// import 'package:whatscooking/ui/shared/customAppBar.dart';
// import 'package:whatscooking/ui/shared/customButton.dart';
//
// class SpinWheel extends StatelessWidget {
//   StreamController<int> controller = StreamController<int>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(
//           appBarActionButtonType: AppBarActionButtonType.notification,
//           appBarLeadingButtonType: AppBarLeadingButtonType.menu),
//       body: Column(
//         children: [
//           getHeightSizedBox(h: 10),
//           Text(
//             'Spin the wheel to get your recommendation',
//             textAlign: TextAlign.center,
//             style:
//                 TextStyle(fontWeight: FontWeight.bold, fontSize: getWidth(25)),
//           ),
//           Container(
//             height: 500,
//           //   child: FortuneWheel(
//           //     selected: Stream.value(0),
//           //     // physics: PanPhysics(),
//           //     duration: Duration(seconds: 5),
//           //     items: [
//           //       FortuneItem(
//           //         child: Text('A'),
//           //         // style: FortuneItemStyle(
//           //         //   color: Colors.red,
//           //         //   borderColor: Colors.green,
//           //         //   borderWidth: 3,
//           //         // ),
//           //       ),
//           //       FortuneItem(child: Text('B')),
//           //       FortuneItem(child: Text('B')),
//           //     ],
//           //   ),
//           ),
//           CustomButton(text: 'Spin', onTap: (){})
//
//         ],
//       ),
//     );
//   }
// }
