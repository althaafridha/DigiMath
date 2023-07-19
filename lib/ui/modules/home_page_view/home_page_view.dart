import 'package:calculator_app/state/provider_home/provider_home.dart';
import 'package:calculator_app/ui/config/color.dart';
import 'package:calculator_app/ui/config/shape.dart';
import 'package:calculator_app/ui/config/spacing.dart';
import 'package:calculator_app/ui/config/typography.dart';
import 'package:calculator_app/ui/widget/number_button.dart';
import 'package:calculator_app/ui/widget/operation_button.dart';
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
                                  text: "AC", color: colorConfig(context)),
                              OperationButton(
                                  text: "+/-", color: colorConfig(context)),
                              OperationButton(
                                  text: "%", color: colorConfig(context)),
                              OperationButton(
                                  text: "÷", color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              const NumberButton(text: "7"),
                              const NumberButton(text: "8"),
                              const NumberButton(text: "9"),
                              OperationButton(
                                  text: "x", color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              const NumberButton(text: "4"),
                              const NumberButton(text: "5"),
                              const NumberButton(text: "6"),
                              OperationButton(
                                  text: "-", color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              const NumberButton(text: "1"),
                              const NumberButton(text: "2"),
                              const NumberButton(text: "3"),
                              OperationButton(
                                  text: "+", color: colorConfig(context))
                            ],
                          ),
                          Row(
                            children: [
                              const OperationButton(text: "⌫"),
                              const NumberButton(text: "0"),
                              const NumberButton(text: "."),
                              OperationButton(
                                text: "=",
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
