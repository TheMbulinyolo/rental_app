import 'package:app/features/auth/presentation/pages/singin_page.dart';
import 'package:flutter/material.dart';
import 'package:app/features/auth/presentation/pages/login_page.dart';
import 'features/auth/auth_controller.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthController(),
      child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental App',
      home: SinginPage(),
    );
  }
}

