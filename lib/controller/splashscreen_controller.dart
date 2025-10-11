import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_project_with_category/router/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 5));
    final pref = await SharedPreferences.getInstance();

    final saveUsername = pref.getString("username");

    if (saveUsername != null) {
      Get.offAllNamed(AppRouter.mainMenu);
    } else {
      Get.offAllNamed(AppRouter.loginPage);
    }
  }
}
