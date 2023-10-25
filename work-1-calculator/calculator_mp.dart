import 'dart:io';

void main(List<String> args) {
  print("---HESAP MAKİNESİ----");
  String? userInput;
  int? operationType;
  do {
    print("**Ana Menü** \nLütfen İşlemin Sayisini Giriniz \nToplama --> 1 \nÇikarma --> 2 \nÇarpma --> 3 \nBölme --> 4 \nÇikmak için --> 0");

    userInput = stdin.readLineSync();
    if (userInput == null || !isNumeric(controller : userInput)) {
      print("Hatali giriş. Lütfen bir sayi girin.");
      continue;
    }

    operationType = int.parse(userInput);
    if (operationType == 0) {
      break;
    }
    else if (0 < operationType && operationType < 5) {
      print("Sonuç: ${getCalculated(operationType : operationType)} \n");
    }
    else {
      print("Yanliş giriş yaptiniz. Tekrardan işlem seçin");
    }
  } while (operationType != 0);
  print("---ÇIKIŞ YAPILDI----");
}

bool isNumeric({required String controller}) {
  // ignore: unnecessary_null_comparison
  if (controller == null) {
    return false;
  }
  return double.tryParse(controller) != null;
}

double getCalculated({required int operationType}) {
  double calculated = 0.0;
  double num_one = 0.0;
  double num_two = 0.0;

  for (int i = 0; i < 2; i++) {
    String? userInput;
    do {
    print("${i + 1}.Sayi :");
    userInput = stdin.readLineSync();

    if (userInput == null || !isNumeric(controller : userInput)) {
      print("Hatali giriş. Lütfen bir sayi girin.");
      continue;
    }

    double number = double.parse(userInput);
    i == 0 ? num_one = number : num_two = number;

   if (operationType == 4 && num_two == 0.0 && i == 1) {
      double? numberForDiv;
      String? userInputForDiv;
      do {
        print("Bir sayinin 0 ile bölümü tanimsizdir. Lütfen 0'dan başka bir sayi giriniz");
        print("${i + 1}.Sayi :");
        userInputForDiv = stdin.readLineSync();

        if (userInputForDiv == null || !isNumeric(controller : userInputForDiv)) {
        print("Hatali giriş. Lütfen bir sayi girin.");
        continue;
        }
        numberForDiv = double.parse(userInputForDiv);
        if (numberForDiv != 0 && isNumeric(controller : userInputForDiv)) {
          num_two = numberForDiv;
        }
      } while (!isNumeric(controller : userInputForDiv!) || numberForDiv == 0);
    } else {
      num_two = number;
    } 
    } while (!isNumeric(controller : userInput!));
  }

  if (operationType == 1) {
    calculated = num_one + num_two;
    print("$num_one + $num_two =");
  } else if (operationType == 2) {
    calculated = num_one - num_two;
    print("$num_one - $num_two =");
  } else if (operationType == 3) {
    calculated = num_one * num_two;
    print("$num_one * $num_two =");
  } else if (operationType == 4) {
    calculated = num_one / num_two;
    print("$num_one / $num_two =");
  } else{
    print("Hatali İşlem");
  }
  return calculated;
}
