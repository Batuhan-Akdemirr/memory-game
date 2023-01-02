
import 'package:memory_game_application/core/utils/enum/memory_games_enum.dart';

extension MemoryGameExtension on MemoryGame {
  String getName() {
    switch (this) {
      case MemoryGame.memorygame:
        return 'Memory Game';
      case MemoryGame.tries:
        return 'Tries';
      case MemoryGame.score:
        return 'Score';
    }
  }
}
