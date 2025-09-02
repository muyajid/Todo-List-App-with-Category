import 'package:flutter/material.dart';
import '../widgets/widget_textfield.dart';
import '../widgets/widget_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const AppTextField(label: 'Email'),
          const SizedBox(height: 8),
          const AppTextField(label: 'Password'),
          const SizedBox(height: 12),
          AppButton(text: 'Masuk', onPressed: () {}),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
