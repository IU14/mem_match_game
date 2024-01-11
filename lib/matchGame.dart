// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MatchGame extends StatelessWidget {
  final ThemeData theme;

  const MatchGame({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Scene'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to scene 1
              },
              child: const Text('Scene 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to scene 2
              },
              child: const Text('Scene 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to scene 3
              },
              child: const Text('Scene 3'),
            ),
          ],
        ),
      ),
    );
  }
}
