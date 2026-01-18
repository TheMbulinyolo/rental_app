import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SinginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SinginButton({super.key, required this.onPressed});  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text("S'inscrire"));
  }
}