abstract class Bottle {
  factory Bottle() {
    return CokeBottle();
  }
    void open(){
    print('Bottle is opened');
  }
}

class CokeBottle implements Bottle {
  @override
  void open() {
    print('Coke bottle is opened');
  }
}

void main() {
  Bottle myBottle = Bottle();
  myBottle.open();
}