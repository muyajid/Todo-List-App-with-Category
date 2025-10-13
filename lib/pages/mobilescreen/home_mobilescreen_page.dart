import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/widgets/widget_form_dialog.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';
import 'package:todolist_project_with_category/widgets/widget_textfield.dart';
import 'package:todolist_project_with_category/widgets/widget_dropdown.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class HomeMobilescreenPage extends StatelessWidget {
  HomeMobilescreenPage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutrallight,

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            color: AppColor.neutrallight,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppTextField(
                    label: 'Search Todo',
                    onChanged: (value) {
                      controller.searchTodo(value);
                    },
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(width: 12),
                Obx(
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
              ],
            ),
          ),

          Expanded(
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
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 80),
                  itemCount: controller.todos.length,
                  itemBuilder: (context, index) {
                    final todo = controller.todos[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Slidable(
                        key: ValueKey(index),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                controller.getTodoData(index);
                                Get.defaultDialog(
                                  title: '',
                                  titlePadding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 10,
                                  ),

                                  radius: 12,
                                  content: TodoFormContent(
                                    controller: controller,
                                    buttonText: "Edit Todo",
                                    onPressed: () {
                                      controller.editTodo(index);
                                      Get.back();
                                    },
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(12),
                              backgroundColor: AppColor.primarydark,
                              icon: Icons.update_outlined,
                              label: "Edit",
                            ),
                          ],
                        ),
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
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarydark,
        onPressed: () => Get.toNamed(AppRouter.addTodo),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
