import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.025;
  double get mediumValue => height * 0.03;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);

  EdgeInsets get allPaddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get allPaddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get allPaddingMedium => EdgeInsets.all(mediumValue);

  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowValue);
  EdgeInsets get onlyTopPaddingNormal => EdgeInsets.only(top: normalValue);
  EdgeInsets get onlyTopPaddingMedium => EdgeInsets.only(top: mediumValue);
}
