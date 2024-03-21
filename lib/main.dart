import 'package:flutter/material.dart';
import 'package:password_generator/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple.shade300),
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple.shade300),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PasswordGeneratorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
