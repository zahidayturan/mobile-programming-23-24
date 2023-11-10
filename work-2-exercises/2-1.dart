class Laptop {
  int id;
  String name;
  int ram; 

  Laptop(this.id, this.name, this.ram);

  void printDetails() {
    print('Laptop;  ID: $id, Name: $name, RAM: ${ram}GB');
  }
}

void main() {

  Laptop laptop1 = Laptop(1, 'Laptop X', 8);
  Laptop laptop2 = Laptop(2, 'Laptop Y', 16);
  Laptop laptop3 = Laptop(3, 'Laptop Z', 32);

  laptop1.printDetails();
  laptop2.printDetails();
  laptop3.printDetails();
}
