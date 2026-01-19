import 'package:provider/provider.dart';
import 'package:app/features/auth/auth_controller.dart';
import 'package:flutter/material.dart';

class SinginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SinginButton({super.key, required this.onPressed});  

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return ElevatedButton(
      onPressed: authController.isLoading ? null : onPressed, 
      child: authController.isLoading ?
        const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
        )
      : const Text("S'inscrire")
    );
  }
}