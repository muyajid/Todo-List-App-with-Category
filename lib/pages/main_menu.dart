import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottom_nav_controller.dart';
import 'home_page.dart';
import 'history_page.dart';
import 'profile_page.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});
  final controller = Get.find<BottomNavController>();

  final pages = [HomePage(), HistoryPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
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
