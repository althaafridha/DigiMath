import 'package:digimath/state/provider_home/provider_home.dart';
import 'package:digimath/ui/config/color.dart';
import 'package:digimath/ui/config/shape.dart';
import 'package:digimath/ui/config/spacing.dart';
import 'package:digimath/ui/config/text.dart';
import 'package:digimath/ui/config/typography.dart';
import 'package:digimath/ui/widget/number_button.dart';
import 'package:digimath/ui/widget/operation_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderHome(),
      child: Consumer<ProviderHome>(builder: (context, value, _) {
        return Scaffold(
            backgroundColor: backgroundColorConfig(context),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(normalMargin),
                    height: 290,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 120,
                          width: double.infinity,
                          padding: EdgeInsets.all(normalPadding),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              value.history!,
                              style: TextStyle(
                                color: greyText,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(normalPadding),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                    constraints:
                                        const BoxConstraints(minHeight: 20),
                                    child: SelectableText(
                                      value.controller!,
                                      maxLines: 1,
                                      style: superLargeBoldText(
                                          context, colorConfig(context)),
                                    )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(normalPadding),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(superMaxBorderRadius),
                                topRight:
                                    Radius.circular(superMaxBorderRadius)),
                            color: greyColorConfig(context)),
                        child: Column(children: [
                          Row(
                            children: [
                              OperationButton(
                                  text: ac, color: colorConfig(context)),
                              OperationButton(
                                  text: plusMinus, color: colorConfig(context)),
                              OperationButton(
                                  text: percent, color: colorConfig(context)),
                              OperationButton(
                                  text: divide, color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              NumberButton(text: num7),
                              NumberButton(text: num8),
                              NumberButton(text: num9),
                              OperationButton(
                                  text: multiply, color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              NumberButton(text: num4),
                              NumberButton(text: num5),
                              NumberButton(text: num6),
                              OperationButton(
                                  text: minus, color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              NumberButton(text: num1),
                              NumberButton(text: num2),
                              NumberButton(text: num3),
                              OperationButton(
                                  text: plus, color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              OperationButton(text: delete),
                              NumberButton(text: num0),
                              NumberButton(text: dot),
                              OperationButton(
                                text: equal,
                                backgroundColor: colorConfig(context),
                                color: white,
                              )
                            ],
                          )
                        ])),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
