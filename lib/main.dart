import 'package:bmi_calculator_app/isar_database/isar_service.dart';
import 'package:bmi_calculator_app/models/bmi_history_model.dart';
import 'package:bmi_calculator_app/models/person_model.dart';
import 'package:bmi_calculator_app/pages/home_page.dart';
import 'package:bmi_calculator_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  IsarService isarService = IsarService();
  await isarService.openIsar();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PersonModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BmiHistoryModel()),
        ChangeNotifierProvider(create: (context) => IsarService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
