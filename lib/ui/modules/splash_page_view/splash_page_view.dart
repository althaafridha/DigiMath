import 'package:digimath/state/provider_splash/provider_splash.dart';
import 'package:digimath/ui/config/shape.dart';
import 'package:digimath/ui/config/spacing.dart';
import 'package:digimath/ui/config/text.dart';
import 'package:digimath/ui/config/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/color.dart';
import '../../config/icon.dart';

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
                  Icon(appIcon,
                      color: colorConfig(context), size: superLargeIconAppSize),
                  SizedBox(height: normalPadding),
                  Text(appName, style: largeText(context, null)),
                ],
              ),
            ));
      }),
    );
  }
}
