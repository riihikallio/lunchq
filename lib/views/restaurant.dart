import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lunchq/views/common.dart';

class Restaurant extends StatelessWidget {
  final String name;

  const Restaurant(this.name, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          elevation: 0.0,
        ),
        body: _Body(key: UniqueKey()),
        backgroundColor: const Color(0xFFE66A63), // Theme primary
        floatingActionButton: const SettingsFAB());
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Menu(),
            Pickup(),
            Order(),
          ],
        ));
  }
}

class Entry {
  String name;
  double price;
  bool isChecked;
  Entry(this.name, this.price, {this.isChecked = false});
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final entries = [
    Entry("Lentil Soup", 1.50),
    Entry("Tofu Salad", 2.50),
    Entry("Salmon", 4.50),
    Entry("Bacon", 3.50)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        //padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: 300,
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entries[index].name),
                    Text(NumberFormat("##0.00 €", "fi_FI")
                        .format(entries[index].price))
                  ]),
              value: entries[index].isChecked,
              onChanged: (bool? value) {
                setState(() {
                  entries[index].isChecked = value!;
                });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}

class Pickup extends StatelessWidget {
  const Pickup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text("Pick-up"),
          ElevatedButton(
              onPressed: () async {
                TimeOfDay? pickup = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              child: const Text(
                "SetTime",
                textAlign: TextAlign.center,
              ))
        ]));
  }
}

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text("Total 6,20€"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () {},
              child: const Text("Order"))
        ]));
  }
}
