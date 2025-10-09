import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/database/db_helper.dart';
import 'package:todolist_project_with_category/model/model_todo.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class TodoController extends GetxController {
  final title = TextEditingController();
  final description = TextEditingController();
  final category = RxnString();

  final todos = <ModelTodo>[].obs;
  final history = <ModelTodo>[].obs;
  final todoBackup = <ModelTodo>[];
  final currentFilterValue = 'All'.obs;

  final db = DBHelper();
  final List<String> categories = const ['Work', 'Personal', 'Study'];

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
    fetchHistory();
  }

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    super.onClose();
  }

  Future<void> fetchTodos() async {
    final rows = await db.getTodosActive();
    final list = rows.map(ModelTodo.fromMap).toList();

    todos.assignAll(list);
    todoBackup.clear();
    todoBackup.addAll(list);
  }

  Future<void> fetchHistory() async {
    final rows = await db.getTodosHistory();
    history.assignAll(rows.map(ModelTodo.fromMap).toList());
  }

  Future<void> addTodo() async {
    final titleText = title.text;
    final descriptionText = description.text;
    final categoryValue = category.value ?? '';

    if (titleText.isEmpty || categoryValue.isEmpty) {
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
      'description': descriptionText,
      'category': categoryValue,
      'is_done': 0,
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

  Future<void> deleteTodo(int index) async {
    if (index < 0 || index >= todos.length) return;
    final id = todos[index].id;
    if (id == null) return;

    await db.deleteTodo(id);
    await fetchTodos();

    Get.snackbar(
      'Todo Information',
      'Todo Deleted Successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
    );
  }

  Future<void> deleteHistory(int index) async {
    if (index < 0 || index >= history.length) return;
    final id = history[index].id;
    if (id == null) return;

    await db.deleteTodo(id);
    await fetchHistory();

    Get.snackbar(
      'Todo Information',
      'Todo Delete Successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
    );
  }

  Future<void> markDone(int index) async {
    if (index < 0 || index >= todos.length) return;
    final id = todos[index].id;
    if (id == null) return;

    final changed = await db.markDone(id);
    if (changed > 0) {
      await fetchTodos();
      await fetchHistory();
      Get.snackbar(
        'Todo Information',
        'Complete',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondarygreen,
      );
    }
  }

  void searchTodo(String filterValue) {
    final query = filterValue.trim().toLowerCase();
    if (query.isEmpty) {
      todos.assignAll(todoBackup);
      return;
    }
    todos.assignAll(
      todoBackup.where(
        (todoData) =>
            todoData.todo.toLowerCase().contains(query) ||
            todoData.deskripsi.toLowerCase().contains(query),
      ),
    );
  }

  void filterTodo(String value) {
    currentFilterValue.value = value;

    if (value.isEmpty || value == 'All') {
      todos.assignAll(todoBackup);
      return;
    }

    final query = value.toLowerCase();
    todos.assignAll(
      todoBackup.where((todoData) => todoData.kategori.toLowerCase() == query),
    );
  }
}
