import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/features/auth/auth_controller.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
      onPressed: authController.isLoading ? null : onPressed,
      child: authController.isLoading
          ? const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            )
          : const Text("Se connecter"),
      ),
    );
  }
}
