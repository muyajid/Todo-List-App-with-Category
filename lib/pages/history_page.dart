import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final controller = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.neutrallight,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primarydark,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.historyData.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada history",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.neutralgraymedium,
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.historyData.length,
            itemBuilder: (context, index) {
              final doneTodo = controller.historyData[index];

              return Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        controller.removeHistoryTodo(index);
                      },
                      backgroundColor: AppColor.secondaryred,
                      borderRadius: BorderRadius.circular(20),
                      icon: Icons.delete,
                      label: 'Hapus',
                    ),
                  ],
                ),
                child: TodoItemTile(
                  leadingText: (index + 1).toString(),
                  title: doneTodo.todo,
                  category: "Kategori : ${doneTodo.kategori}",
                  description: doneTodo.deskripsi,
                  done: true,
                  tileColor: AppColor.primarydark.withValues(alpha: 0.15),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
