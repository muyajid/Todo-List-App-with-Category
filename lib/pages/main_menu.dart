import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottom_nav_controller.dart';
import 'home_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});
  final c = Get.find<BottomNavController>();

  final pages = const [HomePage(), HistoryPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[c.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: c.currentIndex.value,
          onTap: c.changePageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
