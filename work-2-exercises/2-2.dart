class House {
  int id;
  String name;
  double prize; 

  House(this.id, this.name, this.prize);

  void printDetails() {
    print('House; ID: $id, Name: $name, Prize: \₺${prize}');
  }
}

void main() {
  List<House> houses = [];
  houses.add(House(1, 'House X', 1320000.00));
  houses.add(House(2, 'House Y', 2120000.00));
  houses.add(House(3, 'House Z', 3220000.00));
  for (var house in houses) {
    house.printDetails();
  }
}