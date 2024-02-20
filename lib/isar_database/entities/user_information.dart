import 'package:isar/isar.dart';

part 'user_information.g.dart';

@Collection()
class UserInformation {
  Id id = Isar.autoIncrement;
  late double height;
  late double weight;
  late double bmi;
  late String result;

}