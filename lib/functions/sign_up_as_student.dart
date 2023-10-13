import 'package:nt_crm/functions/select_gender.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/student.dart';
import 'package:nt_crm/app.dart';

Student signUpAsStudent() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Name");
  var lastName = validator("Surname");
  var password = validator("Password");
  isMale = selectGender();
  var course = validator("Course");

  return repository.createStudent(
    isMale: isMale,
    course: course,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
}


