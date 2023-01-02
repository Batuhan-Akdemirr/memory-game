import 'package:flutter/material.dart';
import 'package:memory_game_application/product/provider/tries_scores.dart';
import 'package:memory_game_application/core/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => TriesScoreProvider()),
      ChangeNotifierProvider<TriesScoreProvider>(
          create: (context) => TriesScoreProvider())
    ],
    builder: (context, child) {
      return const App();
    },
  ));
}
