import 'dart:math';

class BMIResult {
  String message;
  String interpretation;
  BMIResult({this.message, this.interpretation});
}

Map<int, BMIResult> bmiResult = {
  1: BMIResult(
      message: "Overweight",
      interpretation:
          "You have a higher than normal body weight. Try to exercise more."),
  2: BMIResult(
      message: "Normal",
      interpretation: "You have a normal body weight. Good job!"),
  3: BMIResult(
      message: "Underweight",
      interpretation:
          "You have a lower than normal body weight. You can eat a bit more.")
};

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  BMIResult getBMIResult() {
    if (_bmi >= 25) {
      return bmiResult[1];
    }
    if (_bmi > 18.5) {
      return bmiResult[2];
    } else {
      return bmiResult[3];
    }
  }
}
