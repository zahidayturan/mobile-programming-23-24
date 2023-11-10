import 'dart:math';

int? generateRandom() {
  if (Random().nextBool()) {
    return 100;
  } else {
    return null;
  }
}

void main() {
  int? status = generateRandom() ?? 0;
  print(status);
}