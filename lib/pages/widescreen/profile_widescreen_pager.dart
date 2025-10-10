import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project_with_category/controller/auth_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_button.dart';
import 'package:todolist_project_with_category/widgets/widget_profilecard.dart';

class ProfileWidescreenPager extends StatelessWidget {
  ProfileWidescreenPager({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.neutrallight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: ProfileCard(
                        imagePath: 'assets/images/profil1.png',
                        name: "Muhammad Yazid Arsy",
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: ProfileCard(
                        imagePath: 'assets/images/profil2.png',
                        name: "Raden Adika Ruzain Malazi",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 500,
                child: AppButton(
                  text: "Logout",
                  textcolor: AppColor.neutrallight,
                  backgroundcolor: AppColor.secondaryred,
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text("Confirm Logout"),
                        content: Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text("No"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.logout();
                            },
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
