import 'package:nt_crm/functions/validator.dart';

bool selectGender() {
  late bool isMale;

  bool isTerminated = true;
  do {
    isTerminated = true;
    print("Choose your gender: m (male) / f (female):");
    var input = validator("Gender");
    try {
      switch (input) {
        case "m":
          isMale = true;
          break;
        case "f":
          isMale = false;
          break;
        default:
          throw Exception("The gender was entered incorrectly!");
      }
    } catch (error) {
      isTerminated = false;
    }
  } while (!isTerminated);

  return isMale;
}
