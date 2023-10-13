import 'dart:io'; 
 
import 'package:nt_crm/functions/clear_terminal.dart'; 
import 'package:nt_crm/functions/validator.dart'; 
import 'package:nt_crm/app.dart'; 
import 'package:nt_crm/models/authenticated_user.dart'; 
 
void login() { 
  bool isTerminated = true; 
 
  do { 
    clearTerminal(); 
    print(""" 
Who do you want to register as?
1. Teacher
2. Student
3. Adminstrator
0. Back 
"""); 
 
    var input = validator("Command"); 
 
    var command = int.tryParse(input) ?? -1; 
 
    if (command == -1) { 
      print("You entered an invalid value!"); 
    } else { 
      if (command == 0) { 
        isTerminated = true; 
      } else if (command == 1|| command == 2 || command == 3) { 
        authenticatedUser = loginAsUser(command); 
      } else { 
        print("You have entered a command that does not exist!"); 
      } 
    } 
  } while (!isTerminated); 
} 
 
AuthenticatedUser? loginAsUser(int command) { 
  AuthenticatedUser? authenticatedUser; 
  var id = validator("ID"); 
  var password = validator("Password"); 
 
  try { 
    if (command == 1) { 
      authenticatedUser = teacherRepository.fetchTeacher(id, password); 
    } else if (command == 2) { 
      authenticatedUser = repository.fetchStudent(id, password); 
    } else { 
      authenticatedUser = adminRepository.fetchAdmin(id, password); 
    } 
  } catch (e) { 
    print("User not found."); 
    stdin.readLineSync(); 
  } 
 
  return authenticatedUser; }