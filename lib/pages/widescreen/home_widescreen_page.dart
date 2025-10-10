import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_dropdown.dart';
import 'package:todolist_project_with_category/widgets/widget_textfield.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';

class HomeWidescreenPage extends StatelessWidget {
  HomeWidescreenPage({super.key});
  final controller = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.neutrallight,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: AppTextField(
                      label: 'Search Todo',
                      onChanged: (value) {
                        controller.searchTodo(value);
                      },
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Obx(
                      () => Expanded(
                        flex: 1,
                        child: CategoryDropdown(
                          items: ["All", ...controller.categories],
                          label: 'Category',
                          value: controller.currentFilterValue.toString(),
                          onChanged: (value) {
                            controller.filterTodo(value.toString());
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Obx(() {
                  if (controller.todos.isEmpty) {
                    return const Center(
                      child: Text(
                        "There is no todo yet.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.neutralgraymedium,
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.todos.length,
                      itemBuilder: (context, index) {
                        final todo = controller.todos[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Slidable(
                            key: ValueKey(index),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.deleteTodo(index);
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  backgroundColor: AppColor.secondaryred,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: TodoItemTile(
                              leadingText: (index + 1).toString(),
                              title: todo.todo,
                              category: todo.kategori,
                              description: todo.deskripsi,
                              tileColor: AppColor.primaryblue.withValues(
                                alpha: 0.08,
                              ),
                              date: todo.tanggal,
                              onCheck: () => controller.markDone(index),
                              done: false,
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarydark,
        onPressed: () => Get.toNamed(AppRouter.addTodo),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
