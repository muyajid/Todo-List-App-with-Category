import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final renderTodo = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: renderTodo.todoData.length,
          itemBuilder: (context, index) {
            final todo = renderTodo.todoData[index];
            return TodoItemTile(
              leadingText: todo.kategori,
              title: todo.todo,
              category: todo.deskripsi,
              tileColor: Colors.greenAccent,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/addtodo'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
