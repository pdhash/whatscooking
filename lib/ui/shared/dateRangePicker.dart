import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class GlobalRangePicker {
  GRangePickerController gRangePickerController =
      Get.find<GRangePickerController>();
  GlobalRangePicker() {
    gRangePickerController.dateString =
        "${dateNameConverter(initialDate.startDate)} - ${dateNameConverter(initialDate.endDate)}";
  }

  Future<void> showChooseDialog() async {
    await Get.dialog(Dialog(
      insetPadding: EdgeInsets.all(25),
      child: Container(
        height: 500,
        margin: EdgeInsets.all(7),
        child: SfDateRangePicker(
          showActionButtons: true,
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            if (args.value is PickerDateRange) {
              gRangePickerController.dateString = dateNameConverter(
                      args.value.startDate) +
                  ' - ' +
                  dateNameConverter(args.value.endDate ?? args.value.startDate);
            }
          },
          selectionMode: DateRangePickerSelectionMode.range,
          initialSelectedRange: initialDate,
          onSubmit: (Object value) {
            Get.back();
          },
          onCancel: () {
            Get.back();
          },
        ),
      ),
    ));
  }

  var initialDate = PickerDateRange(
      DateTime.now().subtract(const Duration(days: 7)),
      DateTime.now().add(const Duration(days: 7)));
  String dateNameConverter(DateTime? date) {
    return DateFormat("MMMM d").format(date!);
  }
}

class GRangePickerController extends GetxController {
  late String _dateString = '';

  String get dateString => _dateString;

  set dateString(String value) {
    _dateString = value;
    update();
  }
}
