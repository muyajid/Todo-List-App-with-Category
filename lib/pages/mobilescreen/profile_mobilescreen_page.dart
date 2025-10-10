import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/auth_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_button.dart';
import 'package:todolist_project_with_category/widgets/widget_profilecard.dart';

class ProfileMobilescreenPage extends StatelessWidget {
  ProfileMobilescreenPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(height: 16),
          ProfileCard(
            imagePath: "assets/images/profil1.png",
            name: "Muhammad Yazid Arsy",
          ),
          SizedBox(height: 16),
          ProfileCard(
            imagePath: "assets/images/profil2.png",
            name: "Raden Adika Ruzain Malazi",
          ),
          SizedBox(height: 16),
          AppButton(
            text: "Logout",
            textcolor: AppColor.neutrallight,
            backgroundcolor: AppColor.secondaryred,
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: Text("Confirm Logout"),
                  content: Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(onPressed: () => Get.back(), child: Text("No")),
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
        ],
      ),
    );
  }
}
