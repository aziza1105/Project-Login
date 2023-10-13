import 'dart:io';

String validator(String type) {
  bool isTerminated = true;
  late String? input;
  do {
    isTerminated = true;
    print("Enter ${type}_:");
    input = stdin.readLineSync();
    try {
      if (input == null || input.isEmpty) {
        throw Exception("$type can not be empty!");
      }
    } catch (error) {
      print(
          "You entered an incorrect value for $type . Please, re-enter a value:");
      isTerminated = false;
    }
  } while (!isTerminated);
  return input!;
}
