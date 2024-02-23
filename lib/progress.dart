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
      body: Center(
        child: Container(
            color: Colors.yellow[100],
            padding: EdgeInsets.all(14.0),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/play_button.png')),
                  Flexible(
                      child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Suspendisse dictum ante eu sem rhoncus mattis. Sed sollicitudin feugiat erat quis dignissim. Sed eget ultricies sapien.Nullam dapibus dolor augue, sit amet efficitur nunc viverra sed. Nulla eget tristique leo. Sed rutrum ante at augue accumsan lacinia.Phasellus dapibus, ipsum sit amet ultrices posuere, lectus quam blandit mi, vel aliquam magna arcu tempus urna. Duis ultricies fringilla lacus at tincidunt.",
                  )),
                  Image(image: AssetImage('assets/images/play_button.png')),
                ])),
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
