import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_application/app/widgets/shape_card.dart';
import 'package:memory_game_application/product/init/game_init.dart';
import 'package:provider/provider.dart';
import 'package:memory_game_application/core/utils/extension/context_extension.dart';
import '../../product/provider/tries_scores.dart';

class GameArea extends StatefulWidget {
  const GameArea({super.key, required this.game});
  final Game game;

  @override
  State<GameArea> createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
            itemCount: widget.game.gameImg!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: MediaQuery.of(context).size.height * 0.025,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
            ),
            padding: context.allPaddingNormal,
            itemBuilder: (context, index) {
              return FlipCard(
                flipOnTouch: true,
                onFlip: () {
                  context.read<TriesScoreProvider>().incramentTries();
                  setState(() {
                    _changeImage(index);
                  });
                  if (widget.game.matchCheck.length == 2) {
                    if (widget.game.matchCheck[0].values.first ==
                        widget.game.matchCheck[1].values.first) {
                      _incramentTies(context);
                    } else {
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          _changeHiddenImage();
                        });
                      });
                    }
                  }
                },
                front: ShapeCard(imagePath: widget.game.gameImg![index]),
                back: ShapeCard(imagePath: widget.game.gameImg![index]),
              );
            }));
  }

  void _changeHiddenImage() {
    widget.game.gameImg![widget.game.matchCheck[0].keys.first] =
        widget.game.hiddenCardpath;
    widget.game.gameImg![widget.game.matchCheck[1].keys.first] =
        widget.game.hiddenCardpath;
    widget.game.matchCheck.clear();
  }

  void _incramentTies(BuildContext context) {
    context.read<TriesScoreProvider>().incramentScore();
    widget.game.matchCheck.clear();
  }

  void _changeImage(int index) {
    widget.game.gameImg![index] = widget.game.mixedCardList[index];
    widget.game.matchCheck.add({index: widget.game.mixedCardList[index]});
  }
}
