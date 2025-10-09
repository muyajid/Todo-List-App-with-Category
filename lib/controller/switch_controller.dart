import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchController extends GetxController {
  var isMobile = true.obs;

  void updateScreen(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
