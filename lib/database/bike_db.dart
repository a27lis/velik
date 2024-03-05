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
 VALUES ('GT','0aaaaaaaa','горный','frame','fork',24,'maxxis','v','27.5','best',0,'assets/images/outleap_machine.jpg'), ('я больной','бьлдкпдк','лялялялля','','fork',24,'maxxis','v','27.5','best',0,'assets/images/outleap_machine.jpg');
""");


  }

  Future<List<Bike>> fetchAll() async {
    final database = await DatabaseService().database;
    final bikes = await database.rawQuery('''SELECT * FROM $tableName;''');
    return bikes.map((bike) => Bike.fromSqfliteDatabase(bike)).toList();
  }
}
