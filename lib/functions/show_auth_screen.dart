import 'dart:io';

import 'package:nt_crm/functions/clear_terminal.dart';
import 'package:nt_crm/functions/login.dart';
import 'package:nt_crm/functions/sign_up.dart';
import 'package:nt_crm/functions/terminate_app.dart';
import 'package:nt_crm/app.dart';

void showAuthScreen() {
  String? input = stdin.readLineSync();

  if (input == null) {
    print("You have not entered any commands!");
  } else {
    
    var parsedInput = int.tryParse(input);

    if (parsedInput == null) {
      print("You entered an invalid value!");
    } else {
      clearTerminal();
      if (parsedInput <= 3 && parsedInput >= 0) {
        switch (parsedInput) {
          case 0:
            isTerminated = terminateApp();
            break;
          case 1:
            signUp();
            break;
          case 2:
            login();
            break;
          case 3:
            var teachers = teacherRepository.fetchTeachers();
            for (final teacher in teachers) {
              print(teacher);
            }
            var students = repository.fetchStudents();
            for (final student in students) {
              print(student);
            }
            var admins = adminRepository.fetchAdmins();
            for (final admin in admins) {
              print(admin);
            }

            stdin.readLineSync();
            break;
          default:
        }
      } else {
        print("The command you entered does not exist!");
      }
    }
  }
}
