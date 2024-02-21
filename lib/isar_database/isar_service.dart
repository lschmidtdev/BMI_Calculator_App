import 'package:bmi_calculator_app/isar_database/entities/user_information.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService extends ChangeNotifier{
  static late Isar isarDB;

  static Future<void> initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    isarDB = await Isar.open(
      [UserInformationSchema],
      directory: dir.path,
    );
  }

  final ValueNotifier<List<UserInformation>> currentUserInformations = ValueNotifier([]);
  

  Future<void> addUserInformation(double height, double weight, double bmi, String result) async {
    final newUserInformation = UserInformation()
      ..height = height
      ..weight = weight
      ..bmi = bmi
      ..result = result;

      await isarDB.writeTxn(() => isarDB.userInformations.put(newUserInformation));

      await getAllUserInformation();
  }

  Future<void> getAllUserInformation() async {
    List<UserInformation> allUserInformation = await isarDB.userInformations.where().findAll();
    currentUserInformations.value = allUserInformation;
  }
  

  Future<void> cleanDB() async {
    final isar = await isarDB;
    await isar.writeTxn(() => isar.clear());
  }
}