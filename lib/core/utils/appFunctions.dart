import 'package:flutter/material.dart';

void disposeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
