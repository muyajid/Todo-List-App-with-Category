import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project_with_category/controller/splashscreen_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Ini Splash Screen",
            style: TextStyle(
              fontSize: 25,
              color: AppColor.primarydark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
