import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/rePassword_field.dart';
import '../widgets/singin_button.dart';
import 'package:provider/provider.dart';
import 'package:app/features/auth/auth_controller.dart';

class SinginPage extends StatefulWidget {
  const SinginPage({super.key});

  @override
  State<SinginPage> createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  void _submit() async {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      final authController = Provider.of<AuthController>(context, listen: false);
      final success = await authController.singin(emailController.text, passwordController.text);

      if(success && mounted ) {
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (_) => HomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EmailField(controller: emailController),
              const SizedBox(height: 16),
              PasswordField(controller: passwordController),
              const SizedBox(height: 16),
              RepasswordField(controller: rePasswordController, originController: passwordController),
              const SizedBox(height: 24),
              SinginButton(onPressed: _submit),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text("Vous avez déjà un compte ? Se connecter"),
              ),
            ],
          ),
        )
      ),
    );
  }
}
