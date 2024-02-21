import 'package:bmi_calculator_app/isar_database/isar_service.dart';
import 'package:bmi_calculator_app/utils/values/values.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_spacer/custom_spacer.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_spacer/custom_spacer_width_8.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_text_field.dart';
import 'package:bmi_calculator_app/utils/widgets/user_input_text_title.dart';
import 'package:flutter/material.dart';

class UserInformationsScreenState extends StatefulWidget {


  const UserInformationsScreenState({super.key});

  @override
  State<UserInformationsScreenState> createState() => __UserInformationsScreenStateState();
}

class __UserInformationsScreenStateState extends State<UserInformationsScreenState> {

  TextEditingController nameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: Paddings.all16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserInputTextTitle(title: StringsConstants.name),
          const CustomSpacerHeight8(),
          CustomTextField(labelColor: Colors.black, controller: nameController),
          const CustomSpacer16(),
          const UserInputTextTitle(title: StringsConstants.height),
          const CustomSpacerHeight8(),
          CustomTextField(labelColor: Colors.black, controller: heightController),
          const CustomSpacer16(),
          const UserInputTextTitle(title: StringsConstants.weight),
          const CustomSpacerHeight8(),
          CustomTextField(labelColor: Colors.black, controller: weightController),
          const CustomSpacer16(),
          Center(
            child: ElevatedButton(
              onPressed: (){
                try{
                  double height = double.parse(heightController.text);
                  double weight = double.parse(weightController.text);
                  double bmi = weight / (height * height);
                  String result;
                  if(bmi < 18.5){
                    result = 'underweight';
                  }else if(bmi >= 18.5 && bmi < 24.9){
                    result = 'normal';
                  }else if(bmi >= 24.9 && bmi < 29.9){
                    result = 'overweight';
                  }else{
                    result = 'obese';
                  }
                  IsarService().addUserInformation(height, weight, bmi, result); 
                  setState(() {
                    heightController.clear();   
                    weightController.clear();
                    nameController.clear();        
                  });
                } on FormatException{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter valid numbers for age, height, and weight.'))
                      );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('An error occurred. Please try again.'))
                      );
                      return;
                }
              },
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple.withOpacity(0.4)),
                    ), 
              child: const Text(
                      StringsConstants.calculateBMI,
                      style: TextStyle(color: AppColors.textBlack),
                    )),
          )

        ],
      ),
    );
  }
}