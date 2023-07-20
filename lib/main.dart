import 'package:digimath/ui/config/color.dart';
import 'package:digimath/ui/config/routes.dart';
import 'package:digimath/ui/config/text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: primaryDarkColor,
          secondary: secondaryDarkColor,
        ),
        useMaterial3: true
      ),
      title: appName,
       theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: true
      ),
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
