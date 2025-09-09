import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final renderTodo = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(200, 17, 148, 208),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: renderTodo.todoData.length,
          itemBuilder: (context, index) {
            final todo = renderTodo.todoData[index];
            return Slidable(
              key: ValueKey(index),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      renderTodo.removeTodo(index);
                    },
                    borderRadius: BorderRadius.circular(20),
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Hapus',
                  ),
                ],
              ),
              child: TodoItemTile(
                leadingText: (index + 1).toString(),
                title: todo.todo,
                category: "Kategori : ${todo.kategori}",
                description: todo.deskripsi,
                tileColor: const Color.fromARGB(17, 0, 140, 255),
                onCheck: () => renderTodo.markDoneTodo(index),
                done: false,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(144, 17, 148, 208),
        onPressed: () => Get.toNamed(AppRouter.addTodo),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
