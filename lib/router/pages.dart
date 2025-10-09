import 'package:get/route_manager.dart';
import 'package:todolist_project_with_category/binding/splashscreen_binding.dart';
import 'package:todolist_project_with_category/binding/todo_binding.dart';
import 'package:todolist_project_with_category/pages/add_todo_page.dart';
import 'package:todolist_project_with_category/pages/history_page.dart';
import 'package:todolist_project_with_category/pages/home_page.dart';
import 'package:todolist_project_with_category/pages/login_page.dart';
import 'package:todolist_project_with_category/pages/main_menu.dart';
import 'package:todolist_project_with_category/pages/profile_page.dart';
import 'package:todolist_project_with_category/pages/splashscreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/login_widescreen_page.dart';
import 'package:todolist_project_with_category/router/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouter.loginPage,
      page: () => LoginPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.mainMenu,
      page: () => MainMenu(),
      binding: TodoBinding(),
    ),
    GetPage(name: AppRouter.home, page: () => HomePage()),
    GetPage(name: AppRouter.history, page: () => HistoryPage()),
    GetPage(name: AppRouter.profile, page: () => ProfilePage()),
    GetPage(name: AppRouter.addTodo, page: () => AddTodoPage()),
    GetPage(
      name: AppRouter.splashScreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRouter.loginWideScreen,
      page: () => LoginWidescreenPage(),
      binding: TodoBinding(),
    ),
  ];
}
