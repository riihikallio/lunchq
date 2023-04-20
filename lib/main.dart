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
          // splashColor: const Color(0xFFE66A63),
          // highlightColor: const Color(0xFFE66A63),
          // hoverColor: const Color(0xFFE66A63),
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Select restaurant"),
              elevation: 0.0,
            ),
            body: Body(),
            backgroundColor: const Color(0xFFE66A63), // Theme primary
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFFD29DAC), // Theme secondary
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

    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20)),
              constraints:
                  BoxConstraints.loose(Size(500, restaurants.length * 90)),
              margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: btns)),
        ));
  }
}

class RestaurantBtn extends StatelessWidget {
  final String name;

  const RestaurantBtn(this.name, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 70,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        child: Row(children: [
          Expanded(child: Text(name)),
          const Icon(Icons.star_border)
        ]),
      ),
    );
  }
}
