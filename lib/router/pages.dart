import 'package:get/route_manager.dart';
import 'package:todolist_project_with_category/binding/todo_binding.dart';
import 'package:todolist_project_with_category/pages/add_todo_page.dart';
import 'package:todolist_project_with_category/pages/history_page.dart';
import 'package:todolist_project_with_category/pages/home_page.dart';
import 'package:todolist_project_with_category/pages/login_page.dart';
import 'package:todolist_project_with_category/pages/main_menu.dart';
import 'package:todolist_project_with_category/pages/profile_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => LoginPage(), binding: TodoBinding()),
    GetPage(name: '/mainmenu', page: () => MainMenu(), binding: TodoBinding()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/history', page: () => HistoryPage()),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(name: '/addtodo', page: () => AddTodoPage()),
  ];
}
