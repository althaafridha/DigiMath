import 'package:calculator_app/state/provider_splash/provider_splash.dart';
import 'package:calculator_app/ui/config/spacing.dart';
import 'package:calculator_app/ui/config/text.dart';
import 'package:calculator_app/ui/config/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/color.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderSplash(context),
      child: Consumer<ProviderSplash>(builder: (context, value, _) {
        return Scaffold(
            backgroundColor: backgroundColorConfig(context),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calculate, color: colorConfig(context), size: 100),
                  SizedBox(height: normalPadding),
                  Text(appName, style: largeText(context, null)),
                ],
              ),
            ));
      }),
    );
  }
}
