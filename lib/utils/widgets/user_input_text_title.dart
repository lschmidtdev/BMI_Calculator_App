import 'package:bmi_calculator_app/utils/values/values.dart';
import 'package:flutter/material.dart';

class UserInputTextTitle extends StatelessWidget {
  final String title;
  
  const UserInputTextTitle({
    super.key,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: Paddings.left8,
            child: Text(title),
          );
  }
}