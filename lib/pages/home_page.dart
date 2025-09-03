import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(child: Text('Home Page')),

        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30, bottom: 20),
            child: FloatingActionButton(
              onPressed: () => Get.to(() => const AddTodoPage()),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
