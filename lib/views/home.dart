import 'package:flutter/material.dart';
import 'package:lunchq/views/common.dart';
import 'package:lunchq/views/restaurant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select restaurant"),
          elevation: 0.0,
        ),
        body: _Body(key: UniqueKey()),
        backgroundColor: const Color(0xFFE66A63), // Theme primary
        floatingActionButton: const SettingsFAB());
  }
}

class _Body extends StatelessWidget {
  _Body({super.key});
  final List<String> restaurants = ["YOLO", "Buffa", "Curry", "LAB", "Street"];

  @override
  Widget build(BuildContext context) {
    final List<_RestaurantBtn> btns =
        restaurants.map((n) => _RestaurantBtn(n)).toList();

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

class _RestaurantBtn extends StatelessWidget {
  final String name;

  const _RestaurantBtn(this.name, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 70,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Restaurant(name),
            ),
          )
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(children: [
          Expanded(child: Text(name)),
          const Icon(Icons.star_border)
        ]),
      ),
    );
  }
}
