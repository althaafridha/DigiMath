import 'package:digimath/ui/config/color.dart';
import 'package:flutter/material.dart';

String get fontFamily => 'Roboto';

class TextSize {
  static const small = 12.0;
  static const normal = 16.0;
  static const medium = 20.0;
  static const large = 24.0;
  static const superLarge = 72.0;
}

TextStyle smallText(context,) => TextStyle(
      fontSize: TextSize.small,
      fontWeight: FontWeight.w500,
      color: textColorConfig(context),
      fontFamily: fontFamily);

TextStyle smallBoldText(context,) => TextStyle(
      fontSize: TextSize.small,
      fontWeight: FontWeight.w700,
      color: textColorConfig(context),
      fontFamily: fontFamily);

TextStyle normalText (context) => TextStyle(
      fontSize: TextSize.normal,
      fontWeight: FontWeight.w500,
      color: textColorConfig(context),
      fontFamily: fontFamily);

TextStyle normalBoldText (context, color) => TextStyle(
      fontSize: TextSize.normal,
      fontWeight: FontWeight.w700,
      color: color ?? textColorConfig(context),
      fontFamily: fontFamily);

TextStyle mediumText (context, color) => TextStyle(
      fontSize: TextSize.medium,
      fontWeight: FontWeight.w500,
      color: color ?? textColorConfig(context),
      fontFamily: fontFamily);

TextStyle mediumBoldText (context, color) => TextStyle(
      fontSize: TextSize.medium,
      fontWeight: FontWeight.w700,
      color: color ?? textColorConfig(context),
      fontFamily: fontFamily);

TextStyle largeText (context, color) => TextStyle(
      fontSize: TextSize.large,
      fontWeight: FontWeight.w500,
      color: color ?? textColorConfig(context),
      fontFamily: fontFamily);

TextStyle largeBoldText (context, color) => TextStyle(
      fontSize: TextSize.large,
      fontWeight: FontWeight.w700,
      color: color ?? textColorConfig(context),
      fontFamily: fontFamily);

TextStyle superLargeText (context, color) => TextStyle(
      fontSize: TextSize.superLarge,
      fontWeight: FontWeight.w500,
      color: color ?? textColorConfig(context),
      fontFamily: fontFamily);

TextStyle superLargeBoldText (context, color) => TextStyle(
      fontSize: TextSize.superLarge,
      fontWeight: FontWeight.w700,
      color: color ?? textColorConfig(context),
      fontFamily: fontFamily);
