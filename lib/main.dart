import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<String> restaurants = ["YOLO", "Buffa", "Curry", "LAB", "Street"];

  @override
  Widget build(BuildContext context) {
    final List<RestaurantCard> cards =
        restaurants.map((n) => RestaurantCard(n)).toList();
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: generateMaterialColor(color: Color(0xFFE66A63)),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Select restaurant"),
        ),
        body: Center(
          child: Container(child: Column(children: cards)),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;

  const RestaurantCard(this.name, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () => {},
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text(name),
      ),
    );
  }
}
