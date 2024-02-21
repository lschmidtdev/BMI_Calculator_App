import 'package:bmi_calculator_app/isar_database/entities/user_information.dart';
import 'package:bmi_calculator_app/isar_database/isar_service.dart';
import 'package:bmi_calculator_app/utils/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Data {
  final double var1;
  final double var2;
  final double var3;
  final String text;

  Data({required this.var1, required this.var2, required this.var3, required this.text});
}

class UserResultsScreen extends StatefulWidget {
  @override
  _UserResultsScreenState createState() => _UserResultsScreenState();
}

class _UserResultsScreenState extends State<UserResultsScreen> {
  final List<Data> dataList = [
    Data(var1: 1.0, var2: 2.0, var3: 3.0, text: 'Item 1'),
    Data(var1: 4.0, var2: 5.0, var3: 6.0, text: 'Item 2'),
    // Add more items here...
  ];

  @override
  Widget build(BuildContext context) {
    final isarService = context.read<IsarService>();

    return ValueListenableBuilder<List<UserInformation>>(
      valueListenable: isarService.currentUserInformations,
      builder: (context, currentUserInformations, child) {
        return Padding(
          padding: Paddings.all16,
          child: ListView.builder(
            itemCount: currentUserInformations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(currentUserInformations[index].toString()),
                subtitle: Text('Heigth: ${currentUserInformations[index].height}, Weight: ${currentUserInformations[index].weight}, BMI: ${currentUserInformations[index].bmi}'),
              );
            },
          ),
        );
      },
    );
  }
}
