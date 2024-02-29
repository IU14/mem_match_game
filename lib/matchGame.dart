import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mem_match_game/main.dart';

class MatchGame extends StatelessWidget {
  final ThemeData theme;
  final Image selectedScene;
  final Image randomObject;

  MatchGame(
    this.selectedScene,
    this.randomObject,
    this.theme,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Find the matching object!'),
        ),
        body: Center(
          child: Container(
            color: Colors.yellow[100],
            padding: const EdgeInsets.all(
              8.0,
            ),
            //game logic in here
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: randomObject,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 450,
                            height: 250,
                            child: selectedScene,
                          )
                        ]),
                  ),
                ]),
          ),
        ),
        //bottom navigation bar
        bottomNavigationBar: Builder(builder: (BuildContext context) {
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
        }));
  }
}
