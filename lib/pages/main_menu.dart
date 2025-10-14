import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/main_menu_mobilescreen.dart';
import 'package:todolist_project_with_category/pages/widescreen/main_menu_widescreen_page.dart';
import '../controller/bottom_nav_controller.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});
  final controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.updateScreen(constraints);
          });

          return Obx(
            () => controller.isMobile.value
                ? MainMenuMobilescreen()
                : MainMenuWidescreenPage(),
          );
        },
      ),
    );
  }
}
