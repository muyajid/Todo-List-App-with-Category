import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_button.dart';
import 'package:todolist_project_with_category/widgets/widget_profilecard.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.neutrallight,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primarydark,
        centerTitle: true,
      ),
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
                        Get.offAllNamed(AppRouter.loginPage);
                        Get.snackbar(
                          "Information",
                          "Logout successful",
                          backgroundColor: AppColor.secondarygreen,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 2),
                        );
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
