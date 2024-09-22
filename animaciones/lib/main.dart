import 'package:flutter/material.dart';
import 'package:animaciones/Screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Aquí se define el tema de la app
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueAccent,
      )), // Esto crea el tema completo a partir de un color base
      home: const HomeScreen(),
    );
  }
}
