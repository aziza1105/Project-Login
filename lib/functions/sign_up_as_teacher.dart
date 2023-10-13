import 'package:nt_crm/app.dart';
import 'package:nt_crm/functions/select_gender.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/teacher.dart';

Teacher signUpAsTeacher() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Name");
  var lastName = validator("Surname");
  var password = validator("Password");
  isMale = selectGender();
  var subject = validator("Subject");

  return teacherRepository.createTeacher(
    isMale: isMale,
    salary: 0,
    subject: subject,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
  }
