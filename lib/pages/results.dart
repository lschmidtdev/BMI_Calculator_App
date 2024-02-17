import 'package:bmi_calculator_app/models/bmi_history.dart';
import 'package:bmi_calculator_app/models/bmi_history_model.dart';
import 'package:bmi_calculator_app/models/person_model.dart';
import 'package:bmi_calculator_app/utils/values/values.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_spacer/custom_spacer.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_spacer/custom_text.dart';
import 'package:bmi_calculator_app/utils/widgets/simple_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key,});

  @override
  Widget build(BuildContext context) {
    
    final person = Provider.of<PersonModel>(context).person;
    final bmiHistoryModel = Provider.of<BmiHistoryModel>(context).bmiHistoryList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      drawer: const SimpleDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.all32,
          child: 
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: 
                    Container(
                      padding: Paddings.all16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.lightBlue),
                      ),
                      child: Column(
                        children: [
                          CustomText(labelText: "Name: ${person.name}", fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                          const CustomSpacer16(),
                          CustomText(labelText: "Age: ${person.age}", fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                          const CustomSpacer16(),
                          CustomText(labelText: "Height: ${person.height}", fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                          const CustomSpacer16(),
                          CustomText(labelText: "Weight: ${person.weight}", fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                          const CustomSpacer16(),
                          CustomText(labelText: "BMI: ${person.bmi}", fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                        ],
                      ),
                    ),
                ),
                CustomSpacer16(),
              Container(
          padding: Paddings.all16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.lightBlue),
          ),
          height: 300,
          child:
         ListView.builder(
          shrinkWrap: true,
          itemCount: bmiHistoryModel.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Center(child: Text("BMI Record: ${index + 1}"),),
              subtitle: Center(child: Text('Height: ${bmiHistoryModel[index].height}, Weight: ${bmiHistoryModel[index].weight}, BMI: ${bmiHistoryModel[index].bmi}'),),
            );
          },
        ),
            
          
        )
          
          
        
              ],
            ),
          
        ),
      ),
    );
  }
}