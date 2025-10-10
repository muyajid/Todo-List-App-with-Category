import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_nav_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class MainMenuMobilescreen extends StatelessWidget {
  MainMenuMobilescreen({super.key});
  final controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.pagesTitle[controller.currentIndex.value],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.neutrallight,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primarydark,
          centerTitle: true,
          elevation: 0,
        ),
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 237, 241, 248),
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: AppColor.primarydark),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, color: AppColor.primarydark),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: AppColor.primarydark),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
