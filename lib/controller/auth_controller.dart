import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  void auth() {
    String usernameToString = username.toString().trim();
    String passwordToString = password.toString().trim();

    if (usernameToString == "raden" && passwordToString == "yazid") {
      Get.snackbar(
        "Auth",
        "Login Berhasil",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Auth",
        "Login Gagal",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
