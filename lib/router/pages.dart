import 'package:get/route_manager.dart';
import 'package:todolist_project_with_category/binding/todo_binding.dart';
import 'package:todolist_project_with_category/pages/login_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => LoginPage(), binding: TodoBinding()),
  ];
}
