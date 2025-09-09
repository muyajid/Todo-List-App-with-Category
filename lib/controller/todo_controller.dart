import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/model/model_todo.dart';
import 'package:todolist_project_with_category/router/routes.dart';

class TodoController extends GetxController {
  var todo = TextEditingController();
  var deskripsi = TextEditingController();
  var kategori = RxnString();

  var todoData = <ModelTodo>[].obs;
  var historyData = [].obs;

  void addTodo() {
    String tdToString = todo.text.toString();
    String dkToString = deskripsi.text.toString();
    String ktValue = kategori.value.toString();

    if (tdToString.isNotEmpty && kategori.value != null) {
      todoData.add(ModelTodo(tdToString, dkToString, ktValue));
      Get.snackbar(
        "Todo Info",
        "Todo berhasil ditambahkan",
        backgroundColor: Color.fromARGB(200, 17, 148, 208),
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
      "Todo Info",
      "Todo gagal ditambahkan",
      backgroundColor: Colors.redAccent,
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
    historyData.add(todoItem);
    Get.snackbar(
      "Todo Info",
      "Complete",
      backgroundColor: const Color.fromARGB(200, 17, 148, 208),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }

  void removeHistoryTodo(int index) {
    historyData.removeAt(index);
    Get.snackbar(
      "Todo Info",
      "Todo History Berhasil Di Hapus",
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }

  void removeTodo(int index) {
    todoData.removeAt(index);
    Get.snackbar(
      "Todo Info",
      "Todo Berhasil Di Hapus",
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }
}
