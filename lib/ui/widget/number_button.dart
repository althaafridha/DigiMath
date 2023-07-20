import 'package:digimath/state/provider_home/provider_home.dart';
import 'package:digimath/ui/config/color.dart';
import 'package:digimath/ui/config/spacing.dart';
import 'package:digimath/ui/config/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/shape.dart';

class NumberButton extends StatefulWidget {
  const NumberButton({
    super.key,
    required this.text,
    this.color,
    this.backgroundColor,
  });

  final String text;
  final Color? color;
  final Color? backgroundColor;

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHome>(builder: (context, value, _) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            value.addNum(widget.text);
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
