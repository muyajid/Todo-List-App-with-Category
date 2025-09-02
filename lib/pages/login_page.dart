import 'package:flutter/material.dart';
import '../widgets/widget_textfield.dart';
import '../widgets/widget_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              cs.primary.withOpacity(0.1),
              const Color.fromARGB(184, 206, 205, 205),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
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
                      const SizedBox(height: 12),

                      // email
                      AppTextField(
                        label: 'Email',
                        controller: emailC,
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      const SizedBox(height: 8),

                      // password + toggle show/hide
                      AppTextField(
                        label: 'Password',
                        controller: passC,
                        obscureText: _hidePass,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              setState(() => _hidePass = !_hidePass),
                          icon: Icon(
                            _hidePass ? Icons.visibility : Icons.visibility_off,
                          ),
                          tooltip: _hidePass ? 'Tampilkan' : 'Sembunyikan',
                        ),
                      ),

                      const SizedBox(height: 12),
                      AppButton(text: 'Login', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
