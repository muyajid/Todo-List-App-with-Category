import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todolist_project_with_category/controller/splashscreen_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: AppColor.primarydark,
          size: 50,
        ),
      ),
    );
  }
}
