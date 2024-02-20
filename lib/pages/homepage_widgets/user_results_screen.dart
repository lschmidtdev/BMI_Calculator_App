import 'package:bmi_calculator_app/utils/values/values.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_spacer/custom_spacer_width_8.dart';
import 'package:flutter/material.dart';

class Data {
  final double var1;
  final double var2;
  final double var3;
  final String text;

  Data({required this.var1, required this.var2, required this.var3, required this.text});
}

class UserResultsScreen extends StatelessWidget {
  final List<Data> dataList = [
    Data(var1: 1.0, var2: 2.0, var3: 3.0, text: 'Item 1'),
    Data(var1: 4.0, var2: 5.0, var3: 6.0, text: 'Item 2'),
    // Add more items here...
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.all16,
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return 
              ListTile(
                    title: Text(dataList[index].text),
                    subtitle: Text('Var1: ${dataList[index].var1}, Var2: ${dataList[index].var2}, Var3: ${dataList[index].var3}'),
                  );
          },
        ),
    );
  }
}