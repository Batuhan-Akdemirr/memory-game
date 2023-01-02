import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_game_application/core/utils/constants.dart/color_constants.dart';

class Game {
  final int cardCount = 8;
  final Color hiddenCard = ColorConstants.hiddenCardColor;

  List<String>? gameImg = [];
  List<int> index = List.filled(8, -1);

  bool _flag = true;
  final String hiddenCardpath = "assets/images/hidden.png";
  final List<String> _cardLists = [
    "assets/images/circle.png",
    "assets/images/triangle.png",
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/star.png",
    "assets/images/heart.png",
  ];

  List<String> mixedCardList = [];

  List<Map<int, String>> matchCheck = [];

  initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
    mixedCardList = _mix();
  }

 List<String> _mix() {
    int randomNumber = 0;
    while (_flag) {
      randomNumber = Random().nextInt(cardCount);
      if (!index.contains(randomNumber)) {
        mixedCardList.add(_cardLists[randomNumber]);
        index[randomNumber] = randomNumber;
      } else {
        continue;
      }

      _flag = _control();
    }

    return mixedCardList;
  }

  bool _control() {
    if (!index.contains(-1)) {
      return false;
    } else {
      return true;
    }
  }

  void newGame() {
    index = List.filled(8, -1);
    _flag = true;
    mixedCardList = [];
    mixedCardList = _mix();
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
