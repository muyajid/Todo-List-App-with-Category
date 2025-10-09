import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project_with_category/controller/auth_controller.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_button.dart';
import 'package:todolist_project_with_category/widgets/widget_textfield.dart';

class LoginWidescreenPage extends StatelessWidget {
  LoginWidescreenPage({super.key});
  final controller = Get.find<AuthController>();
  final ValueNotifier<bool> hidePass = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.neutrallight,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/icon.png', height: 56),
                        const SizedBox(height: 8),
                        const Text(
                          'Todolist App',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 350,
                          child: AppTextField(
                            label: 'Username',
                            prefixIcon: const Icon(Icons.person_outline),
                            controller: controller.username,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 350,
                          child: ValueListenableBuilder<bool>(
                            valueListenable: hidePass,
                            builder: (context, value, _) {
                              return AppTextField(
                                label: 'Password',
                                obscureText: value,
                                prefixIcon: const Icon(Icons.lock_outline),
                                controller: controller.password,
                                suffixIcon: IconButton(
                                  onPressed: () => hidePass.value = !value,
                                  icon: Icon(
                                    value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        AppButton(
                          text: 'Login',
                          textcolor: AppColor.neutrallight,
                          backgroundcolor: AppColor.primaryblue,
                          onPressed: () {
                            controller.auth();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
