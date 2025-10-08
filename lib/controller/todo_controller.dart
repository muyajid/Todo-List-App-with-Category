import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/database/db_helper.dart';
import 'package:todolist_project_with_category/model/model_todo.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class TodoController extends GetxController {
  var title = TextEditingController();
  var description = TextEditingController();
  var category = RxnString();

  final todos = <ModelTodo>[].obs;
  final history = [].obs;
  final backupTodo = <ModelTodo>[].obs;
  final db = DBHelper();

  final List<String> categories = ['Work', 'Personal', 'Study'];

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    final data = await db.getTodos();

    final todoList = data.map((e) {
      return ModelTodo(
        e['title'] ?? '',
        e['description'] ?? '',
        e['category'] ?? '',
        e['date'] ?? '',
        status: (e['status'] ?? 0) == 1,
      );
    }).toList();

    todos.assignAll(todoList);
    backupTodo.assignAll(todoList);
  }

  Future<void> addTodo() async {
    final titleText = title.text.trim();
    final descText = description.text.trim();
    final categoryText = category.value?.toString() ?? '';

    if (titleText.isEmpty || categoryText.isEmpty) {
      Get.snackbar(
        'Todo Information',
        'Todo Failed To Add',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondaryred,
      );
      return;
    }

    await db.insertTodo({
      'title': titleText,
      'description': descText,
      'category': categoryText,
    });

    await fetchTodos();
    title.clear();
    description.clear();
    category.value = null;

    Get.offNamed(AppRouter.mainMenu);
    Get.snackbar(
      'Todo Information',
      'Todo Added Successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
    );
  }

  void removeHistoryAt(int index) {
    if (index >= 0 && index < history.length) history.removeAt(index);
  }

  Future<void> markDone(int index) async {
    final item = todos[index];
    final doneTodo = ModelTodo(
      item.todo,
      item.deskripsi,
      item.kategori,
      item.tanggal,
    );
    history.add(doneTodo);
    todos.removeAt(index);

    Get.snackbar(
      'Todo Information',
      'Complete',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
    );
  }

  var currentFilterValue = "All".obs;
  void searchTodo(String searchValue) {
    if (searchValue.isEmpty) {
      todos.assignAll(todos);
    } else {
      var filteredData = backupTodo
          .where(
            (todo) =>
                todo.todo.toLowerCase().contains(searchValue.toLowerCase()),
          )
          .toList();
      todos.assignAll(filteredData);
    }
  }

  void filterTodo(String filterValue) {
    currentFilterValue.value = filterValue;
    if (filterValue.isEmpty || filterValue == "All") {
      todos.assignAll(backupTodo);
      return;
    }
    var filteredData = backupTodo
        .where(
          (todos) =>
              todos.kategori.toLowerCase().contains(filterValue.toLowerCase()),
        )
        .toList();
    todos.assignAll(filteredData);
  }
}
