import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'components/scene.dart';
import 'components/thisObject.dart';

class MatchGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await Flame.images.load(
      'objects-sprite-0.png',
    );
    await Flame.images.load(
      'objects-sprite-1.png',
    );
    await Flame.images.load(
      'objects-sprite-2.png',
    );
    await Flame.images.load(
      'objects-sprite-3.png',
    );
    await Flame.images.load(
      'objects-sprite-4.png',
    );
    await Flame.images.load(
      'objects-sprite-5.png',
    );
    await Flame.images.load(
      'scene-sprite-0.png',
    );
    await Flame.images.load(
      'scene-sprite-1.png',
    );
    await Flame.images.load(
      'scene-sprite-2.png',
    );
  }

// global variables
  static const double objectWidth = 200;
  static const double objectHeight = 200;
  static const double sceneWidth = 550;
  static const double sceneHeight = 350;
  static final Vector2 objectSize = Vector2(objectWidth, objectHeight);
  static final Vector2 sceneSize = Vector2(sceneWidth, sceneHeight);

  final scene = Scene();
  final object = ThisObject();

  // game constructor
}

MatchGame initializeGame() {
  return MatchGame();
}
