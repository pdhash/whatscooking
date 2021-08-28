import 'package:get/get.dart';
import 'package:whatscooking/ui/shared/imagePicker.dart';

final AppImagePicker appImagePicker = AppImagePicker();
void showMessage(String msg) {
  Get.snackbar(msg, "", snackPosition: SnackPosition.BOTTOM);
}
