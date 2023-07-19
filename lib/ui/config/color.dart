import 'package:flutter/material.dart';

Color primaryDarkColor = const Color(0xFF007BFF);
Color secondaryDarkColor = const Color(0xFF00BFFF);
Color primaryColor = const Color(0xFF0b577d);
Color secondaryColor = const Color(0xFF0080FF);

Color black = const Color(0xFF000000);
Color white = const Color(0xFFFFFFFF);
Color darkGrey = const Color(0xFF282B32);
Color grey = const Color(0xFF2A2D35);
Color lightGrey = const Color(0xFFD1D1D1);
Color superLightGrey = const Color(0xFFF5F5F5);
Color red = const Color(0xffa1121b);
Color green = const Color(0xff14a112);

Color darkBackgroundColor = const Color(0xFF23252C);

Color greyText = const Color(0xFF6f6f70);

Color colorConfig(context) {
  Color primaryColor = Theme.of(context).colorScheme.primary;
  return primaryColor;
}

Color backgroundColorConfig(context){
  Color backgroundColor = Theme.of(context).brightness == Brightness.light ? white : darkBackgroundColor;
  return backgroundColor;
 }

Color greyColorConfig(context) {
  Color color =
      Theme.of(context).brightness == Brightness.light ? superLightGrey : grey;
  return color;
}

Color buttonColorConfig(context) {
  Color color =
      Theme.of(context).brightness == Brightness.light ? lightGrey : darkGrey;
  return color;
}

Color textColorConfig(context) {
  Color textColor =
      Theme.of(context).brightness == Brightness.light ? black : white;
  return textColor;
}
