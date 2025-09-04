import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  const ProfileCard({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: AssetImage(imagePath)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Kelas: 11 PPLG 1",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    "SMK Raden Umar Said",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
