import 'package:flutter/material.dart';

class Queue extends StatelessWidget {
  const Queue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Queue"),
        elevation: 0.0,
      ),
      body: _Body(key: UniqueKey()),
      backgroundColor: const Color(0xFFE66A63), // Theme primary
    );
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
      child: Align(
        alignment: Alignment.topCenter,
        child: _Cam(),
      ),
    );
  }
}

class _Cam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20)),
        constraints: BoxConstraints.loose(const Size(600, 250)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
              "At ${MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay.now(), alwaysUse24HourFormat: true)}"),
          Image.network(
              'https://easyflow.tech/storage/2021/05/Queue-Management-1.jpg'),
        ]));
  }
}
