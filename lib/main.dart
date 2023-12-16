import 'package:flutter/material.dart';
import 'AppTheme.dart';

void main() {
  runApp(const MyApp());
}

//main class for the app, has the home page within it
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // building the home page buttons
  @override
  Widget build(BuildContext context) {
    const appTheme = AppTheme();

    Widget playButton = Container(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
          onPressed: () {
            // Action to perform when Play button is pressed
          },
          child: Icon(
            Icons.star,
            color: appTheme.tertiaryColor,
          )),
    ])));

    Column _buildButtonColumn(
      Color color,
      IconData icon,
      String label,
    ) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    // setting the button colour
    Color color = appTheme.primaryColor;

    Widget otherButtons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Action to perform when Progress button is pressed
          },
          child: _buildButtonColumn(color, Icons.addchart, 'Progress'),
        ),
        ElevatedButton(
          onPressed: () {
            // Action to perform when Progress button is pressed
          },
          child: _buildButtonColumn(color, Icons.logout, 'Exit'),
        )
      ],
    );

    //building the app page
    return MaterialApp(
      theme: appTheme.toThemeData(),
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
