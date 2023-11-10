class Camera {
  int? _id;
  String? _brand;
  String? _color;
  double? _prize; 

  set id(int id) => _id = id;
  set brand(String brand) => _brand = brand;
  set color(String color) => _color = color;
  set prize(double prize) {
    if (prize < 0) {
      print("Price cannot be less than 0");
      throw Exception("Price cannot be less than 0");
    }
    this._prize = prize;
  }
  int get id => this._id!;
  String get brand => this._brand!;
  String get color => this._color!;
  double get prize => this._prize!;
}

void main() {
  Camera newCamera = new Camera();
  newCamera.id = 1;
  newCamera.brand = "X";
  newCamera.color= "Black";
  newCamera.prize = 6500;
  print("Camera 1; id: ${newCamera.id} brand:${newCamera.brand} color:${newCamera.color} prize:${newCamera.prize}");

  Camera newCamera2 = new Camera();
  newCamera2.id = 2;
  newCamera2.brand = "Y";
  newCamera2.color= "White";
  newCamera2.prize = 3000;
  print("Camera 1; id: ${newCamera2.id} brand:${newCamera2.brand} color:${newCamera2.color} prize:${newCamera2.prize}");

  Camera newCamera3 = new Camera();
  newCamera3.id = 3;
  newCamera3.brand = "Z";
  newCamera3.color= "Yellow";
  newCamera3.prize = -25; //wrong prize
  print("Camera 1; id: ${newCamera3.id} brand:${newCamera3.brand} color:${newCamera3.color} prize:${newCamera3.prize}");
}