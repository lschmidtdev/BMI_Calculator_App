class Person {
  String _name;
  int _age;
  double _height;
  double _weight;
  double _bmi;

  Person(this._name, this._age, this._height, this._weight, this._bmi);

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  int get age => _age;

  set age (int age) {
    _age = age;
  }

  double get height => _height;

  set height(double height) {
    _height = height;
  }

  double get weight => _weight;

  set weight(double weight) {
    _weight = weight;
  }

  double get bmi => _bmi;

  set bmi(double bmi) {
    _bmi = bmi;
  }

}
