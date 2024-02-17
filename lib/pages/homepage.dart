import 'package:bmi_calculator_app/functions/bmi_calculator.dart';
import 'package:bmi_calculator_app/models/bmi_history.dart';
import 'package:bmi_calculator_app/models/bmi_history_model.dart';
import 'package:bmi_calculator_app/models/person.dart';
import 'package:bmi_calculator_app/models/person_model.dart';
import 'package:bmi_calculator_app/pages/results.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_spacer/custom_spacer.dart';
import 'package:bmi_calculator_app/utils/widgets/custom_text_field.dart';
import 'package:bmi_calculator_app/utils/widgets/simple_drawer.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../utils/values/values.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  Person person = Person('', 0, 0.0, 0.0, 0.0);
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringsConstants.appTitle,
              style: TextStyle(
                color: AppColors.textBlack,
              )),
        ),
        drawer: SimpleDrawer(),
        body: Padding(
          padding: Paddings.all32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: StringsConstants.name,
                labelColor: Colors.black,
                controller: nameController,
                keyboardType: TextInputType.text,
                inputFormatters: null,
              ),
              const CustomSpacer16(),
              CustomTextField(
                labelText: StringsConstants.age,
                labelColor: Colors.black,
                controller: ageController,
                keyboardType: TextInputType.number,
                inputFormatters:<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,]
              ),
              const CustomSpacer16(),
              CustomTextField(
                labelText: StringsConstants.height,
                labelColor: Colors.black,
                controller: heightController,
                keyboardType: TextInputType.number,
                inputFormatters:<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,]
              ),
              const CustomSpacer16(),
              CustomTextField(
                labelText: StringsConstants.weight,
                labelColor: Colors.black,
                controller: weightController,
                keyboardType: TextInputType.number,
                inputFormatters:<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,]
            ),
              const CustomSpacer16(),
              ElevatedButton(
                  onPressed: () {
                    final personModel = Provider.of<PersonModel>(context, listen: false);
                    final bmiHistoryModel = Provider.of<BmiHistoryModel>(context, listen: false);
                    if (nameController.text.isEmpty) {
                      setState(() {
                        person.name = 'Name not informed';
                        nameController.text = 'Name not informed';
                      });
                      } else {
                      setState(() {
                        person.name = nameController.text;
                      });
                      }
                    try {
                      setState(() {
                      person.age = int.parse(ageController.text);
                      person.height = double.parse(heightController.text);
                      person.weight = double.parse(weightController.text);
                      person.bmi = BMICalculator.calculateBMI(
                      person.weight, person.height);
                    });
                    } on FormatException {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter valid numbers for age, height, and weight.'))
                      );
                      return;
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('An error occurred. Please try again.'))
                      );
                      return;
                    }

                    personModel.setPerson(person);
                    //BmiHistory bmiHistory = BmiHistory(person.height, person.weight, person.bmi);
                    //bmiHistory.saveToHistory();
                    //bmiHistoryModel.addBmiHistory(bmiHistory);
                    bmiHistoryModel.addBmiHistory(BmiHistory(height: person.height, weight: person.weight, bmi: person.bmi));
                    
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResultsPage()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple.withOpacity(0.4)),
                  ),
                  child: const Text(
                    StringsConstants.calculateBMI,
                    style: TextStyle(color: AppColors.textBlack),
                  )),
            ],
          ),
        ));
  }
}
