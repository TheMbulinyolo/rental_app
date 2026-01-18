import 'package:app/features/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/rePassword_field.dart';
import '../widgets/singin_button.dart';


class SinginPage extends StatefulWidget {
  const SinginPage({super.key});

  @override
  State<SinginPage> createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authcontroller = AuthController();

  @override

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  void _submit (){
    final formState = _formKey.currentState;
    if(formState != null && formState.validate()){
      authcontroller.singin(emailController.text, passwordController.text);
    }else{
      print("Formulaire non valide ") ;
    }
  }
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EmailField(controller: emailController),
            PasswordField(controller: passwordController),
            RepasswordField(controller: rePasswordController, originController: passwordController,),
            SinginButton(onPressed: _submit)
          ],
        ),
      )
    );
  }
}