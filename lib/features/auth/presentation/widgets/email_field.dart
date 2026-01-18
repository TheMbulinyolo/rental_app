import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller ;
  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Email "
      ),
      validator: (value) => value!.isEmpty ? "Email Requis " : null 
    );
  }
}