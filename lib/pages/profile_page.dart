import 'package:flutter/material.dart';
import 'package:todolist_project_with_category/widgets/widget_profilecard.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "Data Profil",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
        ],
      ),
    );
  }
}
