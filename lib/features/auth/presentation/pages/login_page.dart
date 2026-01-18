import 'package:app/features/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/login_button.dart';

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
  void dispose () {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      final authController = Provider.of<AuthController>(context, listen: false);
      authController.login(emailController.text, passwordController.text);
    } else {
      print("Formulaire invalide ou FormState null");
    }
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmailField(controller: emailController),
              PasswordField(controller: passwordController),
              LoginButton(onPressed: _submit)
            ],
          ),
        ),
      )
    );
  }
}