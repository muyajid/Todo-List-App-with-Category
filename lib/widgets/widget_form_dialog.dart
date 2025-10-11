import 'package:flutter/material.dart';
import '../controller/todo_controller.dart';
import '../theme/app_color.dart';
import 'widget_textfield.dart';
import 'widget_dropdown.dart';
import 'widget_button.dart';

class TodoFormContent extends StatelessWidget {
  final TodoController controller;

  final String buttonText;
  final VoidCallback onPressed;

  const TodoFormContent({
    super.key,
    required this.controller,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextField(
          label: "Title",
          controller: controller.title,
          prefixIcon: const Icon(Icons.edit_outlined),
        ),
        SizedBox(height: 5),

        AppTextField(
          label: "Description",
          controller: controller.description,
          prefixIcon: const Icon(Icons.notes_outlined),
        ),
        SizedBox(height: 5),
        CategoryDropdown(
          items: controller.categories,
          label: "Category",
          value: controller.category.value,
          onChanged: (value) {
            controller.category.value = value;
          },
        ),
        SizedBox(height: 5),
        AppButton(
          text: buttonText,
          textcolor: AppColor.neutrallight,
          backgroundcolor: AppColor.primaryblue,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
