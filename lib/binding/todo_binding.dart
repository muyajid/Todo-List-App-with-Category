import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/auth_controller.dart';
import 'package:todolist_project_with_category/controller/bottom_nav_controller.dart';
import 'package:todolist_project_with_category/controller/switch_controller.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<SwitchController>(() => SwitchController());
  }
}
