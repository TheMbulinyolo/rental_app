import 'package:flutter/material.dart';

class RepasswordField extends StatelessWidget {
  final TextEditingController controller ;
  final TextEditingController originController ;
  const RepasswordField({
    super.key, 
    required this.controller, 
    required this.originController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Entrer à nouveau votre mot de passe"
      ),
      validator: (value) {
        if( value == null || value.isEmpty ) return " champ requis " ;
        if( value != originController.text ) return " les mots de passe doivent correspondre" ;
        return null ;
      },
    );
  }
}