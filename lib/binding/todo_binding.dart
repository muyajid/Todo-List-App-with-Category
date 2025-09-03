import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/auth_controller.dart';
import 'package:todolist_project_with_category/controller/bottom_nav_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
