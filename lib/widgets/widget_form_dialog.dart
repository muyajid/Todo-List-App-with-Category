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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField(
          label: "Title",
          controller: controller.title,
          prefixIcon: const Icon(Icons.edit_outlined),
        ),
        const SizedBox(height: 16),

        AppTextField(
          label: "Description",
          controller: controller.description,
          prefixIcon: const Icon(Icons.notes_outlined),
        ),
        const SizedBox(height: 16),

        CategoryDropdown(
          items: controller.categories,
          label: "Category",
          value: controller.category.value,
          onChanged: (value) {
            controller.category.value = value;
          },
        ),
        const SizedBox(height: 24),

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
