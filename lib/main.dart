import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_theme/json_theme.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Column buildButtonColumn(
        IconData icon, String label, VoidCallback onPressed) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: Icon(icon),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Memory & Matching Game'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Action to perform when Play button is pressed
            },
            child: const Icon(
              Icons.star,
              size: 100,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.addchart),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Exit',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            // Handle navigation to different pages using a switch statement
            switch (index) {
              case 0:
                // Progress button pressed
                break;
              case 1:
                // Exit button pressed
                break;
            }
          },
        ),
      ),
    );
  }
}
