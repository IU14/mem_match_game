import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
}

//main class for the app, has the home page within it
class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  // building the home page buttons
  @override
  Widget build(BuildContext context) {
    Widget playButton = Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          ElevatedButton(
              onPressed: () {
                // Action to perform when Play button is pressed
              },
              child: const Icon(
                Icons.star,
              )),
        ]));

    Column buildButtonColumn(
      IconData icon,
      String label,
    ) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
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

    Widget otherButtons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Action to perform when Progress button is pressed
          },
          child: buildButtonColumn(Icons.addchart, 'Progress'),
        ),
        ElevatedButton(
          onPressed: () {
            // Action to perform when Progress button is pressed
          },
          child: buildButtonColumn(Icons.logout, 'Exit'),
        )
      ],
    );

    //building the app page
    return MaterialApp(
      theme: theme,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Memory & Matching Game'),
          ),
          body: Column(children: [
            playButton,
            otherButtons,
          ])),
    );
  }
}
