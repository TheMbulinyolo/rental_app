import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'features/auth/auth_controller.dart';
import 'features/home/home_controller.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental App',
      home: HomePage(),
    );
  }
}

