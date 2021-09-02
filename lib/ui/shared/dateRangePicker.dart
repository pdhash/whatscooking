import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalRangePicker {
  GRangePickerController gRangePickerController =
      Get.find<GRangePickerController>();
  GlobalRangePicker() {
    gRangePickerController.dateString =
        "${dateNameConverter(DateTime.now())} - ${dateNameConverter(
      DateTime.now().add(
        Duration(days: (DateTime.daysPerWeek) - DateTime.now().weekday),
      ),
    )}";
  }

  showChooseDialog() {
    if (Platform.isAndroid) {
      showDatePicker(
        context: Get.context as BuildContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050),
      )..then((value) {
          try {
            gRangePickerController.dateString =
                "${dateNameConverter(value)} - ${dateNameConverter(
              value!.add(
                Duration(days: (DateTime.daysPerWeek) - value.weekday),
              ),
            )}";
          } on Exception catch (e) {
            // TODO
          }
        });
    } else if (Platform.isIOS) {
      DatePicker.showDatePicker(
        Get.context as BuildContext,
        onConfirm: (value) {
          gRangePickerController.dateString =
              "${dateNameConverter(value)} - ${dateNameConverter(
            value.add(
              Duration(days: (DateTime.daysPerWeek) - value.weekday),
            ),
          )}";
        },
      );
    }
  }

  // var initialDate = PickerDateRange(
  //     DateTime.now(),
  //     DateTime.now().add(
  //         Duration(days: (DateTime.daysPerWeek) - DateTime.now().weekday)));
  String dateNameConverter(DateTime? date) {
    return DateFormat("MMMM d").format(date!);
  }
}

class GRangePickerController extends GetxController {
  late String _dateString = 'gghght';

  String get dateString => _dateString;

  set dateString(String value) {
    _dateString = value;
    update();
  }
}
