import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compte'),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Text(''),
          ],
        ),
      ),
    );
  }
}