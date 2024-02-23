import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mem_match_game/main.dart';

class ProgressPage extends StatelessWidget {
  final ThemeData theme;

  const ProgressPage({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Celebrate your progress!'),
      ),
      body: const Center(
        // TO DO: Add the progress page information here
      ),
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Back to Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Exit',
              ),
            ],
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(theme: theme),
                    ),
                  );
                  break;
                case 1:
                  SystemNavigator.pop();
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
