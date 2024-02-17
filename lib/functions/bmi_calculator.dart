class BMICalculator {

  static double calculateBMI(double weight, double height) {
    height = height / 100;
    return weight / (height * height);
  }

}