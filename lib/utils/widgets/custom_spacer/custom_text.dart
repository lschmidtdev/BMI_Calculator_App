import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String labelText;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const CustomText({
    required this.labelText,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      labelText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}