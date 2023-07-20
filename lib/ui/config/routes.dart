import 'package:digimath/ui/modules/home_page_view/home_page_view.dart';
import 'package:digimath/ui/modules/splash_page_view/splash_page_view.dart';
import 'package:flutter/material.dart';

const String splashRoute = '/splash';
const String homeRoute = '/home';

const String initialRoute = splashRoute;

final Map<String, WidgetBuilder> routes = {
  splashRoute: (context) => const SplashPageView(),
  homeRoute: (context) => const HomePageView(),
};

void goReplace(BuildContext context, routes) {
  Navigator.pushReplacementNamed(context, routes);
}

void back(context){
  Navigator.pop(context);
}
