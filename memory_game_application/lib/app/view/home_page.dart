import 'package:flutter/material.dart';
import 'package:memory_game_application/product/provider/tries_scores.dart';
import 'package:memory_game_application/app/widgets/game_area.dart';
import 'package:memory_game_application/app/widgets/info_card.dart';
import 'package:memory_game_application/core/utils/constants.dart/color_constants.dart';
import 'package:memory_game_application/core/utils/enum/memory_games_enum.dart';
import 'package:memory_game_application/core/utils/extension/game_extension.dart';
import 'package:memory_game_application/product/init/game_init.dart';
import 'package:memory_game_application/core/utils/extension/context_extension.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Game _game = Game();

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: context.onlyTopPaddingMedium,
            child: Text(MemoryGame.memorygame.getName(),
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Padding(
            padding: context.onlyTopPaddingMedium,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InfoCard(
                  title: MemoryGame.tries.getName(),
                  info: context.watch<TriesScoreProvider>().getTries.toString(),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _newGame(context);
                      });
                    },
                    icon: const Icon(
                      Icons.refresh_outlined,
                      size: 50,
                    )),
                InfoCard(
                    title: MemoryGame.score.getName(),
                    info: context
                        .watch<TriesScoreProvider>()
                        .getScore
                        .toString()),
              ],
            ),
          ),
          Expanded(
              child: GameArea(
            game: _game,
          ))
        ],
      ),
    );
  }

  void _newGame(BuildContext context) {
      _game.newGame();
    context.read<TriesScoreProvider>().reset();
  }
}
