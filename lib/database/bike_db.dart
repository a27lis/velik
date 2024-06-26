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
      "picture2" TEXT NOT NULL,
      "picture3" TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT));
      
    """);
  }

  Future<void> addElements(Database database) async {
    await database.rawInsert(
        """INSERT INTO $tableName (brand, name, type, frame, fork, speed, tires, brake, sizeOfWheels, equipment, favorite, picture, picture2, picture3) 
 VALUES
('Outleap','Machine','BMX','Сплав Cro-Mo','Outleap, стальная', 1 ,'CST Operative 20x2.40','Клещевые','20','Начальный улучшенный',
1,
'assets/images/outleap_machine.png', 
'assets/images/outleap_machine2.png', 
'assets/images/outleap_machine3.png'),
('GT','Aggressor Sport','Кросскантри','Алюминий','SR Suntour M3030, 75мм ход', 21,'WTB Ranger Comp DNA','Дисковые механические',
'27.5','Начальный',0,
'assets/images/aggressor_sport.png', 
'assets/images/aggressor_sport2.png', 
'assets/images/aggressor_sport3.png'),
 ('Outleap','Radius Seven','Кросскантри','Алюминий','SR Suntour XCM HLO',18,'CST Jack Rabbit','Дисковые гидравлические','27.5',
 'Средний',0,
 'assets/images/radius_seven_outleap.png', 
 'assets/images/radius_seven_outleap2.png', 
 'assets/images/radius_seven_outleap3.png'),
 ('Corratec','Vert Elite','Кросскантри','Алюминий','SR Suntour XCR-32 AIR RLR',11,'Schwalbe Rappid Rob','Дисковые гидравлические',
 '29','Средний',1,
 'assets/images/corratec_vert_elite.png', 
 'assets/images/corratec_vert_elite2.png', 
 'assets/images/corratec_vert_elite3.png'),
 ('Outleap','Radius Elite','Кросскантри','Алюминий','SR Suntour XCM-32 RL',18,'Chaoyang Phantom Dry','Дисковые гидравлические',
 '29','Начальный улучшенный',1,
 'assets/images/radius_elite_outleap.png', 
 'assets/images/radius_elite_outleap2.png', 
 'assets/images/radius_elite_outleap3.png'),
 ('Jamis','Durango A1','Кросскантри','Алюминий','SR Suntour XCT-30 HLO',9,' CST Patrol','Дисковые гидравлические','29',
 'Начальный улучшенный', 0,
 'assets/images/jamis_durango.png', 
 'assets/images/jamis_durango2.png', 
 'assets/images/jamis_durango3.png'),
 ('Jamis','Dakar','Трэйл','Алюминий','RockShox Judy Silver TK SA', 10,'WTB Vigilante','Дисковые гидравлические','27.5',
 'Средний',0,
 'assets/images/jamis_dakar.png', 
 'assets/images/jamis_dakar2.png', 
 'assets/images/jamis_dakar3.png'),
 ('GT','Stomper','Кросскантри','Алюминий','GT, сталь', 6,' Kenda Small Block','V-brake','20',
 'Начальный',0,
 'assets/images/gt_stomper_prime.png', 
 'assets/images/gt_stomper_prime2.png', 
 'assets/images/gt_stomper_prime3.png'),
 ('GT','Labomba Pro','Дерт','Алюминий','Manitou Circus Expert', 1,'Kenda 3-Sixty','Дисковые гидравлические','26',
 'Средний',0,
 'assets/images/gt_labomba_pro.png', 
 'assets/images/gt_labomba_pro2.png', 
 'assets/images/gt_labomba_pro3.png')

""");
  }

  Future<List<Bike>> fetchAll() async {
    final database = await DatabaseService().database;
    final bikes = await database.rawQuery('''SELECT * FROM $tableName;''');
    return bikes.map((bike) => Bike.fromSqfliteDatabase(bike)).toList();
  }

  Future<List<Bike>> fetchBike({required int id}) async {
    final database = await DatabaseService().database;
    final bikes =
        await database.rawQuery('''SELECT * FROM $tableName WHERE "id"=$id;''');
    return bikes.map((bike) => Bike.fromSqfliteDatabase(bike)).toList();
  }

  Future<List<Bike>> fetchFavorite() async {
    final database = await DatabaseService().database;
    final bikes = await database
        .rawQuery('''SELECT * FROM $tableName WHERE "favorite"=1;''');
    return bikes.map((bike) => Bike.fromSqfliteDatabase(bike)).toList();
  }

  Future<void> undoFavorite() async {
    final database = await DatabaseService().database;
    await database.execute('UPDATE bikes SET favorite = 0');
  }

  Future<int> update({required int id, int? favorite}) async {
    int res = favorite == 0 ? 1 : 0;
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {if (favorite != null) 'favorite': res},
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }
}
