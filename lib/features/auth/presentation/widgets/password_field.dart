import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {

  final TextEditingController controller ;
  const PasswordField({super.key , required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(labelText: "Mot de passe"),
      validator: (value) =>
          value!.length < 6 ? "Minimum 6 caractères" : null,
    );
  }
}