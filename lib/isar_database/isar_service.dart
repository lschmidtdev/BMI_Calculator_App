import 'package:bmi_calculator_app/isar_database/entities/user_information.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> isarDB;

  IsarService() {
    isarDB = openIsar();
  }


  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [UserInformationSchema],
        directory: dir.path,
        inspector: true
        );
    }  
    return Future.value(Isar.getInstance());
  }

  final List<UserInformation> currentUserInformations = [];

  Future<void> addUserInformation(double height, double weight, double bmi, String result) async {
    final newUserInformation = UserInformation()
      ..height = height
      ..weight = weight
      ..bmi = bmi
      ..result = result;

      final isar = await isarDB;
      await isar.writeTxn(() => isar.userInformations.put(newUserInformation));
  }

  Future<void> getAllUserInformation() async {
    final isar = await isarDB;
    List<UserInformation> allUserInformation = await isar.userInformations.where().findAll();
    currentUserInformations.clear();
    currentUserInformations.addAll(allUserInformation);
  }

  Future<void> cleanDB() async {
    final isar = await isarDB;
    await isar.writeTxn(() => isar.clear());
  }
}