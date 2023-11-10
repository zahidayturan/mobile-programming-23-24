import 'dart:async';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);
  multiplyByTwoAsynchronously(numbers).then((modifiedList) {
    print(modifiedList);
  });
}

Future<List<int>> multiplyByTwoAsynchronously(List<int> numbers) async {
  List<int> modifiedList = [];
  for (int number in numbers) {
    modifiedList.add(await multiplyByTwo(number));
  }
  return modifiedList;
}
Future<int> multiplyByTwo(int number) async {
  print(number);
  await Future.delayed(Duration(milliseconds: 800));
  return number * 2;
}