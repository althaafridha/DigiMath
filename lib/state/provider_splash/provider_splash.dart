import 'package:digimath/ui/config/routes.dart';
import 'package:flutter/material.dart';

class ProviderSplash extends ChangeNotifier {
  ProviderSplash(context) {
    _init(context);
  }

  void _init(context) {
    Future.delayed(const Duration(seconds: 3), () {
      goReplace(context, '/home');
      notifyListeners();
    });
  }
}
