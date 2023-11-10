class Animal {
  int id;
  String name;
  String color;

  Animal(this.id, this.name, this.color);
  void printDetails() {
    print('Animal ID: $id, Name: $name, Color: $color');
  }
}

class Cat extends Animal {
  String sound;
  Cat(int id, String name, String color, this.sound) : super(id, name, color);
  @override
  void printDetails() {
    super.printDetails();
    print('Sound: $sound');
  }
}

void main() {
  Cat cat = Cat(1, 'Tekir', 'Gri', 'Miyav');
  cat.printDetails();
  Animal dog = Animal(2, 'Cins', 'Siyah');
  dog.printDetails();
}
