import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../globals.dart';

class MealPlanController extends GetxController {
  int _isSelected = 1;

  int get isSelected => _isSelected;

  set isSelected(int value) {
    _isSelected = value;
    update();
  }

  String? _dateStr;

  String? get dateStr => _dateStr;

  set dateStr(String? value) {
    _dateStr = value;
    update();
  }

  showChooseDialog() {
    dateStr = null;
    if (Platform.isAndroid) {
      showDatePicker(
        context: Get.context as BuildContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050),
      )..then((value) {
          dateStr = "${dateNameConverter(value)} - ${dateNameConverter(
            value!.add(
              Duration(
                  days: isSelected == 1
                      ? list[isSelected]['number'] - value.weekday
                      : list[isSelected]['number'] - 1),
            ),
          )}";
          update();
        });
    } else if (Platform.isIOS) {
      DatePicker.showDatePicker(
        Get.context as BuildContext,
        onConfirm: (value) {
          dateStr = "${dateNameConverter(value)} - ${dateNameConverter(
            value.add(
              Duration(
                  days: isSelected == 1
                      ? list[isSelected]['number'] - value.weekday
                      : list[isSelected]['number'] - 1),
            ),
          )}";
          update();
        },
      );
    }
  }
}
