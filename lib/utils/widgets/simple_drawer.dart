import 'package:bmi_calculator_app/pages/results.dart';
import 'package:bmi_calculator_app/utils/values/values.dart';
import 'package:flutter/material.dart';

import '../../pages/homepage.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.drawerHeaderColor,
                ),
                child: Text(
                  StringsConstants.drawerHeaderTitle,
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text(StringsConstants.drawerYourInfo),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
                },
              ),
              ListTile(
                title: const Text(StringsConstants.drawerYourResults),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResultsPage()));
                },
              ),
            ],
          ),
        );
  }
}