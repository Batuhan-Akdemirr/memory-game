import 'package:flutter_test/flutter_test.dart';
import 'package:memory_game_application/product/init/game_init.dart';

void main() {
  setUp(() {});
  test('User calculate ', () {
    Game a = Game();

    a.initGame();

    print(a.gameImg);
  });
}
