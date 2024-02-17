import 'package:bmi_calculator_app/models/person.dart';
import 'package:flutter/material.dart';

class PersonModel extends ChangeNotifier {
  Person _person = Person('', 0, 0.0, 0.0, 0.0);

  Person get person => _person;

  void setPerson(Person person) {
    _person = person;
    notifyListeners();
  }
}