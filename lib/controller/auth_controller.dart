import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/router/routes.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  void auth() {
    String usernameToString = username.text.toString().trim();
    String passwordToString = password.text.toString().trim();

    if (usernameToString == "raden" && passwordToString == "yazid") {
      Get.snackbar(
        "Auth",
        "Login Berhasil",
        backgroundColor: Color.fromARGB(200, 17, 148, 208),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
      Get.offNamed(AppRouter.mainMenu);
    } else {
      Get.snackbar(
        "Auth",
        "Login Gagal",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
    username.clear();
    password.clear();
  }
}
