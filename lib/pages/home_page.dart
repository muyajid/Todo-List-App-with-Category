import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/switch_controller.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/home_mobilescreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/home_widescreen_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.find<SwitchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateScreen(constraints);

          return Obx(
            () => controller.isMobile.value
                ? HomeMobilescreenPage()
                : HomeWidescreenPage(),
          );
        },
      ),
    );
  }
}
