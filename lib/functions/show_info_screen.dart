import 'dart:io'; 
import 'package:nt_crm/functions/edit_profile_student.dart'; 
import 'package:nt_crm/functions/edit_profile_teacher.dart'; 
import 'package:nt_crm/functions/sign_up_as_student.dart'; 
import 'package:nt_crm/functions/sign_up_as_teacher.dart'; 
import 'package:nt_crm/functions/terminate_app.dart'; 
import 'package:nt_crm/app.dart'; 
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/administrator.dart'; 
import 'package:nt_crm/models/student.dart'; 
import 'package:nt_crm/models/teacher.dart'; 
 
void showInfoScreen() { 
  if (authenticatedUser is Admin) { 
    String? input = stdin.readLineSync(); 
 
    if (input == null) { 
      print("You have not entered any commands!"); 
    } else { 
      
      var parsedInput = int.tryParse(input); 
 
      if (parsedInput == null) { 
        print("You entered an invalid value!"); 
      } else { 

        if (parsedInput <= 8 && parsedInput >= 1) { 
          switch (parsedInput) { 
            case 1: 
              print(teacherRepository.teachers); 
              break; 
            case 2: 
              print(repository.students); 
              break; 
            case 3: 
              signUpAsTeacher(); 
              break; 
            case 4: 
              signUpAsStudent(); 
              break; 
 
            case 5: 
              var id = validator("id"); 
              var deletedTeacher = teacherRepository.deleteTeacher(id); 
              if (deletedTeacher) { 
                print("The teacher with ID $id has been deleted."); 
              } else { 
                print( 
                    "Something went wrong. No such ID exists. Try again."); 
              } 
              break; 
            case 6: 
              var id = validator("id"); 
              var deletedStudent = repository.deleteStudent(id); 
              if (deletedStudent) { 
                print("The student with ID $id has been deleted."); 
              } else { 
                print("Something went wrong. No such ID exists. Try again."); 
              } 
              break; 
            case 7: 
              authenticatedUser = null; 
              break; 
            case 8: 
              isTerminated = terminateApp(); 
              break; 
            default: 
          } 
        } else { 
          print("The command you entered does not exist!"); 
        } 
      } 
    } 
  } else if (authenticatedUser is Teacher || authenticatedUser is Student) { 
    String? input = stdin.readLineSync(); 
 
    if (input == null) { 
      print("You have not entered any commands!"); 
    } else 
    {  
      var parsedInput = int.tryParse(input); 
 
      if (parsedInput == null) { 
        print("You entered an invalid value!"); 
      } else { 
         
        if (parsedInput <= 5 && parsedInput >= 1) { 
          switch (parsedInput) { 
            case 1: 
              
              if (authenticatedUser is Student) { 
                print(repository.students); 
              } else { 
                print(teacherRepository.teachers); 
              } 
              
              break; 
            case 2: 
               
              if (authenticatedUser is Student) { 
                if (repository.students.isEmpty) { 
                  print("This user was not found."); 
                } else { 
                  authenticatedUser = editProfileStudent(); 
                } 
              } else { 
                if (teacherRepository.teachers.isEmpty) { 
                  print("This user was not found."); 
                } else { 
                  authenticatedUser = editProfileTeacher(); 
                } 
              }
              break; 
            case 3: 
              if (authenticatedUser is Student) { 
                repository.students.remove(authenticatedUser); 
              } else if (authenticatedUser is Teacher) { 
                teacherRepository.teachers.remove(authenticatedUser); 
              } 
              break; 
            case 4: 
              authenticatedUser = null; 
              break; 
            case 5: 
              isTerminated = terminateApp(); 
              break; 
            default: 
          } 
        } else { 
          print("The command you entered does not exist."); 
        } 
      } 
    } 
  } 
}