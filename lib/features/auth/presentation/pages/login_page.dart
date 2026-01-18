import 'package:flutter/material.dart';
import 'singin_page.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/login_button.dart';
import 'package:provider/provider.dart';
import 'package:app/features/auth/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      final authController = Provider.of<AuthController>(context, listen: false);
      authController.login(emailController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailField(controller: emailController),
            const SizedBox(height: 16),
            PasswordField(controller: passwordController),
            const SizedBox(height: 24),
            LoginButton(onPressed: _submit),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // navigation vers Signup
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SinginPage()),
                );
              },
              child: const Text("Vous n'avez pas de compte ? S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
