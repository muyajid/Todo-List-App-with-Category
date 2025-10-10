import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project_with_category/controller/bottom_nav_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class MainMenuWidescreenPage extends StatelessWidget {
  MainMenuWidescreenPage({super.key});
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
          automaticallyImplyLeading: true,
          backgroundColor: AppColor.primarydark,
          centerTitle: false,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: controller.pages[controller.currentIndex.value],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: AppColor.neutrallight),
                child: Center(
                  child: Text(
                    'Todolist Menu',
                    style: TextStyle(
                      color: AppColor.primaryblue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("Home"),
                selected: controller.currentIndex.value == 0,
                onTap: () {
                  controller.changePageIndex(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.history_outlined),
                title: Text("History"),
                selected: controller.currentIndex.value == 1,
                onTap: () {
                  controller.changePageIndex(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text("Profile"),
                selected: controller.currentIndex.value == 2,
                onTap: () {
                  controller.changePageIndex(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
