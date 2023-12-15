import 'package:flutter/material.dart';
import 'AppTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTheme = AppTheme();
    return MaterialApp(
      title: 'Memory & Matching Game',
      theme: appTheme.toThemeData(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory & Matching Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Action to perform when Play button is pressed
              },
              child: const Text('Play'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action to perform when Progress button is pressed
              },
              child: const Text('Progress'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action to perform when Exit button is pressed
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
