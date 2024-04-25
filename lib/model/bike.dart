class Bike{
  final int id;
  final String brand;
  final String name;
  final String type;
  final String frame;
  final String fork;
  final int speed;
  final String tires;
  final String brake;
  final String sizeOfWheels;
  final String equipment;
  int favorite;
  final String picture;
  final String picture2;
  final String picture3;




  Bike({
    required this.id,
    required this.brand,
    required this.name, 
    required this.type, 
    required this.frame, 
    required this.fork,
    required this.speed, 
    required this.tires, 
    required this.brake, 
    required this.sizeOfWheels,
    required this.equipment, 
    required this.favorite,
    required this.picture,
    required this.picture2,
    required this.picture3

  });




  factory Bike.fromSqfliteDatabase(Map<String, dynamic> map) => Bike(
    id: map['id']?.toInt() ?? 0,
    brand: map['brand'] ?? '',
    name: map['name'] ?? '',
    type: map['type'] ?? '',
    frame: map['frame'] ?? '',
    fork: map['fork'] ?? '',
    speed: map['speed']?.toInt() ?? 0,
    tires: map['tires'] ?? '',
    brake: map['brake'] ?? '',
    sizeOfWheels: map['sizeOfWheels'] ?? '',
    equipment: map['equipment'] ?? '',
    favorite: map['favorite']?.toInt() ?? 0,
    picture: map['picture'] ?? '',
    picture2: map['picture2'] ?? '',
    picture3: map['picture3'] ?? ''
    );


}