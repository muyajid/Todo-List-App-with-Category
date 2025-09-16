import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import '../widgets/widget_textfield.dart';
import '../widgets/widget_dropdown.dart';
import '../widgets/widget_button.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final controller = Get.find<TodoController>();
  static const List<String> categories = ['Work', 'Personal', 'Study'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.playlist_add_check_rounded,
                              color: AppColor.primarydark,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Add Todo',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(),

                        const SizedBox(height: 12),
                        AppTextField(
                          label: 'Title',
                          prefixIcon: Icon(Icons.edit_outlined),
                          controller: controller.todo,
                        ),
                        const SizedBox(height: 12),
                        AppTextField(
                          label: 'Description',
                          maxLines: 3,
                          prefixIcon: Icon(Icons.notes_outlined),
                          controller: controller.deskripsi,
                        ),
                        const SizedBox(height: 12),
                        CategoryDropdown(
                          label: 'Category',
                          items: categories,
                          value: controller.kategori.value,
                          onChanged: (value) {
                            controller.kategori.value = value;
                          },
                        ),

                        const SizedBox(height: 16),
                        AppButton(
                          text: 'Add Todo',
                          textcolor: AppColor.neutrallight,
                          backgroundcolor: AppColor.primaryblue,
                          onPressed: () {
                            controller.addTodo();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
