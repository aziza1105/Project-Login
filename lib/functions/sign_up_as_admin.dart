import 'package:nt_crm/app.dart';
import 'package:nt_crm/functions/select_gender.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/administrator.dart';


Admin signUpAsAdmin() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Name");
  var lastName = validator("Surname");
  var password = validator("Password");
  isMale = selectGender();

  return adminRepository.createAdmin(
    isMale: isMale,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
}