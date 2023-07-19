import 'package:calculator_app/ui/config/color.dart';
import 'package:calculator_app/ui/config/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      title: 'Calculator App',
       theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: true
      ),
      initialRoute: '/splash',
      routes: routes,
    );
  }
}
