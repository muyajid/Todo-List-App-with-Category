import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/pages/history_page.dart';
import 'package:todolist_project_with_category/pages/home_page.dart';
import 'package:todolist_project_with_category/pages/profile_page.dart';

class BottomNavController extends GetxController {
  final currentIndex = 0.obs;
  void changePageIndex(int i) => currentIndex.value = i;

  var isMobile = true.obs;

  void updateScreen(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  final pages = [HomePage(), HistoryPage(), ProfilePage()];
  final pagesTitle = ['Home Page', 'History Page', 'Profile Page'];
}
