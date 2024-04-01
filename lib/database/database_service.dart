import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:velik/database/bike_db.dart';

class DatabaseService {
Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    
    
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'bike.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path, 
      version: 1,
      onCreate: create,
      singleInstance: true,
      );
      return database;

  }

  Future<void> create(Database database, int version) async {

    await BikeDB().createTable(database);
    log("create table in create");
    await BikeDB().addElements(database);
    log("add elements in create");

  }
    
}