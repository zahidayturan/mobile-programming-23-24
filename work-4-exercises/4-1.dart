import 'dart:async';
import 'dart:io';

void main() {
  stdout.write('Enter the first number: ');
  int firstNumber = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the second number: ');
  int secondNumber = int.parse(stdin.readLineSync()!);

  print("Sum is Calculating...");

  Future.delayed(Duration(seconds: 3), () {
    int sum = firstNumber + secondNumber;
    print('The sum is: $sum');
  });
}
