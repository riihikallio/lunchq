import 'package:flutter/material.dart';
import 'views/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFE66A63),
              primary: const Color(0xFFE66A63),
              secondary: const Color(0xFFD29DAC),
              tertiary: const Color(0xFFF9DEDC)),
          // splashColor: const Color(0xFFE66A63),
          // highlightColor: const Color(0xFFE66A63),
          // hoverColor: const Color(0xFFE66A63),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        home: const Home());
  }
}
