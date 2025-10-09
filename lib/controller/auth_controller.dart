import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  void auth() async {
    String usernameToString = username.text.toString().trim();
    String passwordToString = password.text.toString().trim();

    if (usernameToString == "raden" && passwordToString == "yazid") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameToString);
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

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Get.offAllNamed(AppRouter.loginPage);
    Get.snackbar(
      "Information",
      "Logout successfuly",
      backgroundColor: AppColor.secondarygreen,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  var isMobile = true.obs;

  void updateScreen(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
