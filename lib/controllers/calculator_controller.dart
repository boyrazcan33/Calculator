import '../models/calculator_model.dart';

class CalculatorController {
  CalculatorModel model = CalculatorModel();
  String display = '0';

  String press(String btn) {
    if (btn == 'C') {
      display = '0';
    } else if ('0123456789'.contains(btn)) {
      if (display == '0') {
        display = btn;
      } else {
        display += btn;
      }
    } else if ('+-×÷'.contains(btn)) {
      display += ' $btn ';
    } else if (btn == '=') {
      List<String> parts = display.split(' ');
      if (parts.length >= 3) {
        double a = double.parse(parts[0]);
        String op = parts[1];
        double b = double.parse(parts[2]);
        double result = model.calculate(a, b, op);
        display += ' = ${result.toInt()}';
      }
    }
    return display;
  }
}