import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/model/model_todo.dart';
import 'package:todolist_project_with_category/router/routes.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class TodoController extends GetxController {
  var todo = TextEditingController();
  var deskripsi = TextEditingController();
  var kategori = RxnString();

  var todoData = <ModelTodo>[].obs;
  var historyData = [].obs;
  var backupTodo = <ModelTodo>[];

  final List<String> categories = ['Work', 'Personal', 'Study'];

  void addTodo() {
    String tdToString = todo.text.toString();
    String dkToString = deskripsi.text.toString();
    String ktValue = kategori.value.toString();
    DateTime now = DateTime.now();
    String date = "${now.day}-${now.month}-${now.year}";

    if (tdToString.isNotEmpty && kategori.value != null) {
      todoData.add(ModelTodo(tdToString, dkToString, ktValue, date));
      backupTodo.add(ModelTodo(tdToString, dkToString, ktValue, date));
      Get.snackbar(
        "Todo Information",
        "Todo successfully added",
        backgroundColor: AppColor.secondarygreen,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 1),
      );
      todo.clear();
      deskripsi.clear();
      kategori.value = null;
      Get.offNamed(AppRouter.mainMenu);
      return;
    }

    Get.snackbar(
      "Todo Information",
      "Todo failed to add",
      backgroundColor: AppColor.secondaryred,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
    todo.clear();
    deskripsi.clear();
    kategori.value = null;
  }

  void markDoneTodo(int index) {
    final todoItem = todoData[index];
    todoItem.status = true;
    todoData.removeAt(index);
    backupTodo.removeAt(index);
    historyData.add(todoItem);
    Get.snackbar(
      "Todo Information",
      "Complete",
      backgroundColor: AppColor.secondarygreen,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }

  void removeHistoryTodo(int index) {
    historyData.removeAt(index);
    Get.snackbar(
      "Todo Information",
      "Todo history successfully deleted",
      backgroundColor: AppColor.secondarygreen,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }

  void removeTodo(int index) {
    todoData.removeAt(index);
    backupTodo.removeAt(index);
    Get.snackbar(
      "Todo Information",
      "Todo Successfully Deleted",
      backgroundColor: AppColor.secondarygreen,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }

  var currentFilterValue = "All".obs;
  void searchTodo(String searchValue) {
    if (searchValue.isEmpty) {
      todoData.assignAll(backupTodo);
    } else {
      var filteredData = backupTodo
          .where(
            (todo) =>
                todo.todo.toLowerCase().contains(searchValue.toLowerCase()),
          )
          .toList();
      todoData.assignAll(filteredData);
    }
  }

  void filterTodo(String filterValue) {
    currentFilterValue.value = filterValue;
    if (filterValue.isEmpty || filterValue == "All") {
      todoData.assignAll(backupTodo);
      return;
    }
    var filteredData = backupTodo.where(
      (todo) => todo.kategori.toLowerCase().contains(filterValue.toLowerCase()),
    );
    todoData.assignAll(filteredData);
  }
}
