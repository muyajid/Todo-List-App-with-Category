import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final historyControl = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Page",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(200, 17, 148, 208),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: historyControl.historyData.length,
          itemBuilder: (context, index) {
            final doneTodo = historyControl.historyData[index];
            return Slidable(
              key: ValueKey(index),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      historyControl.removeHistoryTodo(index);
                    },
                    backgroundColor: Colors.red,
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
                tileColor: const Color.fromARGB(17, 0, 140, 255),
              ),
            );
          },
        ),
      ),
    );
  }
}
