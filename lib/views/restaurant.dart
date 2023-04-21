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

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  double total = 0.0;

  void updateTotal(double change) {
    setState(() {
      total += change;
    });
  }

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
          children: [
            Menu(onChange: updateTotal),
            const Pickup(),
            Order(total: total),
          ],
        ));
  }
}

class _MenuItem {
  String name;
  double price;
  bool isChecked = false;
  _MenuItem(this.name, this.price);
}

class Menu extends StatefulWidget {
  final Function onChange;

  const Menu({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState(onChange);
}

class _MenuState extends State<Menu> {
  final Function onChange;
  _MenuState(this.onChange);

  final List<_MenuItem> entries = [
    _MenuItem("Lentil Soup", 1.50),
    _MenuItem("Tofu Salad", 2.50),
    _MenuItem("Salmon", 4.50),
    _MenuItem("Bacon", 3.50)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
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
                    Text(NumberFormat.simpleCurrency(
                            decimalDigits: 2, locale: "fi_FI")
                        .format(entries[index].price))
                  ]),
              value: entries[index].isChecked,
              onChanged: (bool? value) {
                setState(() {
                  entries[index].isChecked = value!;
                  onChange(
                      value ? entries[index].price : -entries[index].price);
                });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}

class Pickup extends StatefulWidget {
  const Pickup({super.key});

  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  TimeOfDay pickup = TimeOfDay(
      hour: (TimeOfDay.now().hour + 1) % 24, minute: TimeOfDay.now().minute);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: 230,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pick-up"),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(20)),
                      onPressed: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: pickup,
                        );
                        setState(() {
                          pickup = picked ?? pickup;
                        });
                      },
                      child: Text(
                        MaterialLocalizations.of(context).formatTimeOfDay(
                            pickup,
                            alwaysUse24HourFormat: true),
                        textAlign: TextAlign.center,
                      ))
                ])));
  }
}

class Order extends StatelessWidget {
  final double total;

  const Order({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Total " +
              NumberFormat.simpleCurrency(decimalDigits: 2, locale: "fi_FI")
                  .format(total)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(20)),
              onPressed: () {},
              child: const Text("Order"))
        ]));
  }
}
