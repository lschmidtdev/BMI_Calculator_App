import 'package:flutter/foundation.dart';
import 'package:bmi_calculator_app/models/bmi_history.dart';

class BmiHistoryModel extends ChangeNotifier {
  List<BmiHistory> _bmiHistoryList = [];

  List<BmiHistory> get bmiHistoryList => _bmiHistoryList;

  void addBmiHistory(BmiHistory bmiHistory) {
    _bmiHistoryList.add(bmiHistory);
    notifyListeners();
  }
}