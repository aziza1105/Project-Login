import 'package:nt_crm/app.dart';
import 'package:nt_crm/functions/sign_up_as_admin.dart';
import 'package:nt_crm/functions/sign_up_as_student.dart';
import 'package:nt_crm/functions/sign_up_as_teacher.dart';
import 'package:nt_crm/functions/validator.dart';

void signUp() {
  bool isTerminated = true;
  do {
    print("""
Who do you want to register as?
1. Teacher
2. Student
3. Adminstrator
0. Back
""");
    var input = validator("Command");
    var option = int.tryParse(input);
    if (option != null) {
      if (option >= 0 && option <= 3) {
        switch (option) {
          case 0:
            isTerminated = true;
            break;
          case 1:
            authenticatedUser = signUpAsTeacher();
            break;
          case 2:
            authenticatedUser = signUpAsStudent();
            break;
          case 3:
            authenticatedUser = signUpAsAdmin();
            break;
        }
      } else {
        print("There is no such command.");
      }
    } else {
      print("Invalid value entered.");
    }
  } while (!isTerminated);
}
