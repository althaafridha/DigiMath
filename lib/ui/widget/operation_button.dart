import 'package:calculator_app/state/provider_home/provider_home.dart';
import 'package:calculator_app/ui/config/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/shape.dart';
import '../config/spacing.dart';
import '../config/typography.dart';

class OperationButton extends StatefulWidget {
  const OperationButton(
      {super.key, required this.text, this.color, this.backgroundColor});

  final String text;
  final Color? color;
  final Color? backgroundColor;

  @override
  State<OperationButton> createState() => _OperationButtonState();
}

class _OperationButtonState extends State<OperationButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHome>(builder: (context, value, _) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            value.algorithm(widget.text);
          },
          child: Container(
            margin: EdgeInsets.only(
                right: minMargin, left: minMargin, top: normalMargin),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(normalBorderRadius),
                color: widget.backgroundColor ?? buttonColorConfig(context)),
            child: Center(
              child: Text(widget.text,
                  style: largeBoldText(context, widget.color)),
            ),
          ),
        ),
      );
    });
  }
}
