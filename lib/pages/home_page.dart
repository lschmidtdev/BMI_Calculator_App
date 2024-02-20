import 'package:bmi_calculator_app/pages/homepage_widgets/user_informations_screen.dart';
import 'package:bmi_calculator_app/pages/homepage_widgets/user_results_screen.dart';
import 'package:bmi_calculator_app/utils/values/values.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(StringsConstants.appTitle,
              style: TextStyle(
                color: AppColors.textBlack,
              )),
        ),
        body: Padding
        (padding: Paddings.all16,
        child: Row(
          children: [
            Expanded(
              flex: 2,
            child: UserInformationsScreenState(),
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: UserResultsScreen()),
          flex: 3,)
          ],
        ),),
    );
  }
}