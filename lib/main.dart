import 'package:flutter/material.dart';

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
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Select restaurant"),
            ),
            body: Body(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFFD29DAC),
              child: const Icon(Icons.settings),
            )));
  }
}

class Body extends StatelessWidget {
  Body({super.key});
  final List<String> restaurants = ["YOLO", "Buffa", "Curry", "LAB", "Street"];

  @override
  Widget build(BuildContext context) {
    final List<RestaurantBtn> btns =
        restaurants.map((n) => RestaurantBtn(n)).toList();

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)),
          constraints: BoxConstraints.loose(Size(500, restaurants.length * 80)),
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: btns)),
    );
  }
}

class RestaurantBtn extends StatelessWidget {
  final String name;

  const RestaurantBtn(this.name, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 60,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            foregroundColor: Colors.black),
        child: Row(children: [
          Expanded(child: Text(name)),
          const Icon(Icons.star_border)
        ]),
      ),
    );
  }
}
