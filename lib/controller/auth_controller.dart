import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  void auth() {
    String usernameToString = username.text.toString().trim();
    String passwordToString = password.text.toString().trim();

    if (usernameToString == "raden" && passwordToString == "yazid") {
      Get.snackbar(
        "Auth",
        "Login Successful",
        backgroundColor: AppColor.secondarygreen,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
      Get.offNamed(AppRouter.mainMenu);
    } else {
      Get.snackbar(
        "Auth",
        "Login Failed",
        backgroundColor: AppColor.secondaryred,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
    username.clear();
    password.clear();
  }
}
