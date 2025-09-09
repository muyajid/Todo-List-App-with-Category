import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(200, 17, 148, 208),
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
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: Text("Konfirmasi"),
                  content: Text("Apakah anda yakin ingin logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Tidak"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed('/');
                        Get.snackbar(
                          "Info",
                          "Logout Berhasil",
                          backgroundColor: Color.fromARGB(200, 17, 148, 208),
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 2),
                        );
                      },
                      child: Text("Ya"),
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
