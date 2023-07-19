import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderHome extends ChangeNotifier {
  String? controller;
  String? result;
  String? history;

  ProviderHome() {
    _init();
    controller = '0';
    history = '';
  }

  void _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedHistory = prefs.getString('history');
    String? savedController = prefs.getString('controller');

    if (savedHistory != null) {
      history = savedHistory;
    }

    if (savedController != null) {
      controller = savedController;
    }
  }

  void addNumber(String number) {
    if (controller == '0') {
      controller = number;
    } else if (controller == 'Error') {
      controller = number;
    } else {
      controller = controller! + number;
    }
    notifyListeners();
  }

  void safeCurrentNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('history', history!);
    await prefs.setString('controller', controller!);
    notifyListeners();
  }

  void calculate() {
    history = controller;

    try {
      String expressionWithDecimals = convertPercentagesToDecimals(controller!);

      double resultValue = evaluateExpression(expressionWithDecimals);

      if (resultValue == resultValue.toInt()) {
        controller = resultValue.toStringAsFixed(0);
      } else {
        controller = resultValue.toStringAsFixed(1);
      }
    } catch (e) {
      controller = 'Error';
    }
    safeCurrentNumber();

    notifyListeners();
  }

  String convertPercentagesToDecimals(String expression) {
    final RegExp percentageRegex = RegExp(r'(\d+(\.\d+)?)(%)');

    String convertedExpression = expression;
    Iterable<Match> matches = percentageRegex.allMatches(expression);

    for (Match match in matches) {
      String percentageString = match.group(1)!;
      double percentage =
          double.parse(percentageString) / 1000; // Change to 0.205 for 20.5%

      convertedExpression = convertedExpression.replaceRange(
        match.start,
        match.end,
        '*' + percentage.toString(),
      );
    }

    return convertedExpression;
  }

  double evaluateExpression(String expression) {
    List<String> operators = ['+', '-', 'x', '÷'];
    List<String> tokens = tokenize(expression);

    List<String> outputQueue = [];
    List<String> operatorStack = [];

    for (String token in tokens) {
      if (double.tryParse(token) != null) {
        // If the token is a number, add it to the output queue.
        outputQueue.add(token);
      } else if (operators.contains(token)) {
        // If the token is an operator, handle operator precedence.
        while (operatorStack.isNotEmpty &&
            hasHigherPrecedence(operatorStack.last, token)) {
          outputQueue.add(operatorStack.removeLast());
        }
        operatorStack.add(token);
      }
    }

    while (operatorStack.isNotEmpty) {
      outputQueue.add(operatorStack.removeLast());
    }

    return evaluateRPN(outputQueue);
  }

  bool hasHigherPrecedence(String operator1, String operator2) {
    Map<String, int> precedence = {'+': 1, '-': 1, 'x': 2, '÷': 2};
    return precedence[operator1]! >= precedence[operator2]!;
  }

  List<String> tokenize(String expression) {
    List<String> operators = ['+', '-', 'x', '÷'];
    List<String> tokens = [];
    String currentToken = '';

    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];

      if (operators.contains(char)) {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken.trim());
          currentToken = '';
        }
        tokens.add(char);
      } else {
        currentToken += char;
      }
    }

    if (currentToken.isNotEmpty) {
      tokens.add(currentToken.trim());
    }

    return tokens;
  }

  double evaluateRPN(List<String> rpnQueue) {
    List<String> operators = ['+', '-', 'x', '÷'];
    List<double> resultStack = [];

    for (String token in rpnQueue) {
      if (operators.contains(token)) {
        double num2 = resultStack.removeLast();
        double num1 = resultStack.removeLast();
        double result;

        switch (token) {
          case '+':
            result = num1 + num2;
            break;
          case '-':
            result = num1 - num2;
            break;
          case 'x':
            result = num1 * num2;
            break;
          case '÷':
            result = num1 / num2;
            break;
          default:
            result = 0;
        }

        resultStack.add(result);
      } else {
        resultStack.add(double.parse(token));
      }
    }

    return resultStack.first;
  }

  void dot() {
    controller = '$controller.';
    notifyListeners();
  }

  void percent() {
    controller = '$controller%';
    notifyListeners();
  }

  void plus() {
    controller = '$controller+';
    notifyListeners();
  }

  void minus() {
    controller = '$controller-';
    notifyListeners();
  }

  void multiply() {
    controller = '${controller}x';
    notifyListeners();
  }

  void divide() {
    controller = '$controller÷';
    notifyListeners();
  }

  void clearAll() {
    controller = '0';
    history = '';
    notifyListeners();
  }

  void delete() {
    if (controller!.length > 1) {
      controller = controller!.substring(0, controller!.length - 1);
    } else {
      controller = '0';
    }
    notifyListeners();
  }

  void algorithm(text) {
    switch (text) {
      case 'AC':
        clearAll();
        break;
      case '⌫':
        delete();
        break;
      case '%':
        percent();
        break;
      case '.':
        dot();
        break;
      case '+':
        plus();
        break;
      case '-':
        minus();
        break;
      case 'x':
        multiply();
        break;
      case '÷':
        divide();
        break;
      case '=':
        calculate();
        break;
    }
  }

  void addNum(text) {
    switch (text) {
      case '.':
        dot();
        break;
      default:
        addNumber(text);
    }
  }
}
