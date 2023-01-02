import 'package:flutter/widgets.dart';

class TriesScoreProvider extends ChangeNotifier {
  int _score = 0;
  int _tries = 0;

  incramentScore() {
    _score += 100;
    notifyListeners();
  }

  incramentTries() {
    _tries += 1;
    notifyListeners();
  }

  reset() {
    _score = 0;
    _tries = 0;
  }

  int get getScore => _score;
  int get getTries => _tries;
}
