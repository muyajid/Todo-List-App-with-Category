import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';

class HistoryWidescreenPage extends StatelessWidget {
  HistoryWidescreenPage({super.key});
  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Obx(() {
          if (controller.history.isEmpty) {
            return const Center(
              child: Text(
                "No history yet.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.neutralgraymedium,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.history.length,
              itemBuilder: (context, index) {
                final doneTodo = controller.history[index];

                return Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          controller.deleteHistory(index);
                        },
                        backgroundColor: AppColor.secondaryred,
                        borderRadius: BorderRadius.circular(20),
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: TodoItemTile(
                    leadingText: (index + 1).toString(),
                    title: doneTodo.todo,
                    category: "Category : ${doneTodo.kategori}",
                    description: doneTodo.deskripsi,
                    done: true,
                    tileColor: AppColor.primarydark.withValues(alpha: 0.15),
                    showSwipeHint: true,
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
