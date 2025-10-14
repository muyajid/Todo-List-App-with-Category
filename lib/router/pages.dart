import 'package:get/route_manager.dart';
import 'package:todolist_project_with_category/binding/splashscreen_binding.dart';
import 'package:todolist_project_with_category/binding/todo_binding.dart';
import 'package:todolist_project_with_category/pages/add_todo_page.dart';
import 'package:todolist_project_with_category/pages/history_page.dart';
import 'package:todolist_project_with_category/pages/home_page.dart';
import 'package:todolist_project_with_category/pages/login_page.dart';
import 'package:todolist_project_with_category/pages/main_menu.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/history_mobilescreen.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/home_mobilescreen_page.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/login_mobilescreen_page.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/main_menu_mobilescreen.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/profile_mobilescreen_page.dart';
import 'package:todolist_project_with_category/pages/profile_page.dart';
import 'package:todolist_project_with_category/pages/splashscreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/history_widescreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/home_widescreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/login_widescreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/main_menu_widescreen_page.dart';
import 'package:todolist_project_with_category/pages/widescreen/profile_widescreen_pager.dart';
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
    GetPage(
      name: AppRouter.profile,
      page: () => ProfilePage(),
      binding: TodoBinding(),
    ),
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
    GetPage(
      name: AppRouter.mainMenuWideScreen,
      page: () => MainMenuWidescreenPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.homeWideScreen,
      page: () => HomeWidescreenPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.historyWideScreen,
      page: () => HistoryWidescreenPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.profileWideScreen,
      page: () => ProfileWidescreenPager(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.loginMobileScreen,
      page: () => LoginMobilescreenPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.mainMenuMobileScreen,
      page: () => MainMenuMobilescreen(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.homeMobileScreen,
      page: () => HomeMobilescreenPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.historyMobileScreen,
      page: () => HistoryMobilescreen(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRouter.profileMobileScreen,
      page: () => ProfileMobilescreenPage(),
      binding: TodoBinding(),
    ),
  ];
}
