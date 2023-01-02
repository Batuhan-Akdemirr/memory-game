import 'package:flutter/material.dart';
import 'package:memory_game_application/core/utils/constants.dart/color_constants.dart';
import 'package:memory_game_application/core/utils/extension/context_extension.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.title, required this.info});
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.infoCardColor,
          borderRadius: BorderRadius.circular(10)),
      margin: context.allPaddingMedium,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: context.allPaddingLow,
            child: Text(
              info,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
