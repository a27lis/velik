import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:velik/database/database_service.dart';
import 'package:velik/model/bike.dart';

class BikeDB {
  final tableName = 'bikes';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "brand" TEXT NOT NULL,
      "name" TEXT NOT NULL,
      "type" TEXT NOT NULL,
      "frame" TEXT NOT NULL,
      "fork" TEXT NOT NULL,
      "speed" INTEGER NOT NULL,
      "tires" TEXT NOT NULL,
      "brake" TEXT NOT NULL,
      "sizeOfWheels" TEXT NOT NULL,
      "equipment" TEXT NOT NULL,
      "favorite" INTEGER NOT NULL,
      "picture" TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT));
      
    """);

  }

  Future<void> addElements(Database database) async {

    //final database = await DatabaseService().database;
    log("add el");

    await database.rawInsert("""INSERT INTO $tableName (brand, name, type, frame, fork, speed, tires, brake, sizeOfWheels, equipment, favorite, picture) 
 VALUES
('Outleap','Machine','BMX','Сплав Cro-Mo','Outleap, стальная', 1 ,'CST Operative 20x2.40','Клещевые','20','Начальный улучшенный',
1,'assets/images/outleap_machine.jpg'),
('GT','Aggressor Sport','Кросскантри','Алюминий','SR Suntour M3030, 75мм ход', 21,'WTB Ranger Comp DNA','Дисковые механические',
'27.5','Начальный',0,'assets/images/aggressor_sport.jpg'),
 ('Outleap','Radius Seven','Кросскантри','Алюминий','SR Suntour XCM HLO',18,'CST Jack Rabbit','Дисковые гидравлические','27.5',
 'Средний',0,'assets/images/radius_seven_outleap.jpg'),
 ('Corratec','Vert Elite','Кросскантри','Алюминий','SR Suntour XCR-32 AIR RLR',11,'Schwalbe Rappid Rob','Дисковые гидравлические',
 '29','Средний',1,'assets/images/corratec_vert_elite.jpg'),
 ('Outleap','Radius Elite','Кросскантри','Алюминий','SR Suntour XCM-32 RL',18,' Chaoyang Phantom Dry','Дисковые гидравлические',
 '29','Начальный улучшенный',1,'assets/images/radius_elite_outleap.jpg'),
 ('Jamis','Durango A1','Кросскантри','Алюминий','SR Suntour XCT-30 HLO',9,' CST Patrol','Дисковые гидравлические','29',
 'Начальный улучшенный', 0,'assets/images/jamis_duranngo.jpg'),
 ('Jamis','Dakar','Трэйл','Алюминий','RockShox Judy Silver TK SA', 10,'WTB Vigilante','Дисковые гидравлические','27.5',
 'Средний',0,'assets/images/jamis_dakar.jpg'),
 ('GT','Stomper','Кросскантри','Алюминий','GT, сталь', 6,' Kenda Small Block','V-brake','20',
 'Начальный',0,'assets/images/gt_stomper_prime.jpg'),
 ('GT','Labomba Pro','Дерт','Алюминий','Manitou Circus Expert', 1,'Kenda 3-Sixty','Дисковые гидравлические','26',
 'Средний',0,'assets/images/gt_labomba_pro.jpg');

""");


  }

  Future<List<Bike>> fetchAll() async {
    log("fetchall start");
    final database = await DatabaseService().database;
    final bikes = await database.rawQuery('''SELECT * FROM $tableName;''');
    log("fetchall ended");
    return bikes.map((bike) => Bike.fromSqfliteDatabase(bike)).toList();
  }

  Future<List<Bike>> fetchFavorite() async {
    log("fetchFavorite start");
    final database = await DatabaseService().database;
    final bikes = await database.rawQuery('''SELECT * FROM $tableName WHERE "favorite"=1;''');
    log("fetchFavorite ended");
    return bikes.map((bike) => Bike.fromSqfliteDatabase(bike)).toList();
  }
}
