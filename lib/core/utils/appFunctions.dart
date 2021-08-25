import 'package:flutter/material.dart';

disposeKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}
