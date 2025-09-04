import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/model/model_todo.dart';

class TodoController extends GetxController {
  var todo = TextEditingController();
  var deskripsi = TextEditingController();
  var kategori = RxnString();

  var todoData = <ModelTodo>[].obs;

  void addTodo() {
    String tdToString = todo.text.toString();
    String dkToString = deskripsi.text.toString();
    String ktValue = kategori.value.toString();

    if (tdToString.isNotEmpty && dkToString.isNotEmpty && ktValue.isNotEmpty) {
      todoData.add(ModelTodo(tdToString, dkToString, ktValue));
      Get.snackbar(
        "Todo Info",
        "Todo berhasil ditambahkan",
        backgroundColor: Colors.greenAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 1),
      );
      todo.clear();
      deskripsi.clear();
      kategori.value = null;
      Get.toNamed('/mainmenu');
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
}
