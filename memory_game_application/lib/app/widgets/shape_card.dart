import 'package:flutter/material.dart';
import 'package:memory_game_application/core/utils/constants.dart/color_constants.dart';
import 'package:memory_game_application/core/utils/extension/context_extension.dart';

class ShapeCard extends StatelessWidget {
  const ShapeCard({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.allPaddingNormal,
      decoration: BoxDecoration(
        color: ColorConstants.defaultColor,
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
