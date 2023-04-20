import 'package:flutter/material.dart';

class SettingsFAB extends StatelessWidget {
  const SettingsFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color(0xFFD29DAC), // Theme secondary
      child: const Icon(Icons.settings),
    );
  }
}
