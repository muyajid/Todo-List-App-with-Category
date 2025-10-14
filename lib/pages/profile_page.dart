import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/switch_controller.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/profile_mobilescreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/profile_widescreen_pager.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<SwitchController>();

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
                ? ProfileMobilescreenPage()
                : ProfileWidescreenPager(),
          );
        },
      ),
    );
  }
}
