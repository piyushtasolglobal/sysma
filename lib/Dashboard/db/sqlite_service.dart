// ignore_for_file: camel_case_types

import 'package:adani/models/Preventive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'dart:convert';

class dbHelper{
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  Future<Database>? _db;

  Future<Database>? getDb() {
    _db ??= _initDb();
    return _db;
  }

  // Guaranteed to be called only once.
  Future<Database> _initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sysma.db');
    final db = await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async {

        // preventive Schedule Table
        await db.execute("CREATE TABLE Schedule(id INTEGER PRIMARY KEY AUTOINCREMENT,auditSchduleId INTEGER ,assetTagId INTEGER ,auditName TEXT,auditStatus TEXT, image TEXT,assetImage TEXT, modelName TEXT, assetTag TEXT, location TEXT, auditEndDate DATETIME, auditStartDate DATETIME, scheduleExpireDate DATETIME, escalatedAuditLevels TEXT, maintenanceType TEXT, companyName TEXT, categoryName TEXT, purchaseDate DATETIME, supplierName TEXT, warrantyMonths INTEGER,canCheckout INTEGER,canCheckin INTEGER, auditParamsValues TEXT, statusLabel TEXT, dueDate TEXT)",);

        //Work orders schema start

        // workorder table
        await db.execute("CREATE TABLE Workorders(id INTEGER PRIMARY KEY AUTOINCREMENT, workorders_id INTEGER ,ticket_id TEXT ,title TEXT, due_date TEXT, description TEXT,priority_id INTEGER, priority TEXT, category_id INTEGER, category TEXT, assignee_id INTEGER, assignee_name TEXT, status_id INTEGER, status_text TEXT, asset_id INTEGER, asset_name TEXT, asset_working_status  TEXT, location TEXT, created_at DATETIME, updated_at DATETIME)",);

        //workorder supoirtee table
        await db.execute("CREATE TABLE WoSupporters(id INTEGER PRIMARY KEY AUTOINCREMENT,workorders_id INTEGER ,wosupporters_id INTEGER, name TEXT)",);

        //workorder cause
        await db.execute("CREATE TABLE WoCauses(id INTEGER PRIMARY KEY AUTOINCREMENT,workorders_id INTEGER, wocauses_id INTEGER, name TEXT ,cause_name TEXT)",);

        //workorder media
        await db.execute("CREATE TABLE WoMedia(id INTEGER PRIMARY KEY AUTOINCREMENT, workorders_id INTEGER, womedias_id INTEGER ,name TEXT, url TEXT)",);

        //workorder parameters
        await db.execute("CREATE TABLE WoParameters(id INTEGER PRIMARY KEY AUTOINCREMENT,workorders_id INTEGER , woparameters_id INTEGER, param_disp_name TEXT, param_type TEXT, is_inspected TEXT)",);

        //wororder param config
        await db.execute("CREATE TABLE WoParamconfig(id INTEGER PRIMARY KEY AUTOINCREMENT, woparameters_id INTEGER , woparamconfig_id INTEGER, type TEXT, key TEXT, value TEXT, photos TEXT, comment TEXT,  b_range_low TEXT, b_range_high TEXT, dropval_aphotos TEXT, dropval_acomment TEXT, dropval_rphotos TEXT, dropval_rcomment TEXT)",);

        //Work orders schema end

        // completed Schedule Table
        await db.execute("CREATE TABLE CompletedSchedule(id INTEGER PRIMARY KEY AUTOINCREMENT,auditSchduleId INTEGER ,assetTagId INTEGER ,auditName TEXT,auditStatus TEXT, image TEXT,assetImage TEXT, modelName TEXT, assetTag TEXT, location TEXT, auditEndDate DATETIME, scheduleExpireDate DATETIME, escalatedAuditLevels TEXT, maintenanceType TEXT, companyName TEXT, categoryName TEXT, purchaseDate TEXT,lastAuditDate DATETIME,auditInspectionDate DATETIME,auditInspectionDateF DATETIME, supplierName TEXT, warrantyMonths INTEGER,canCheckout INTEGER,canCheckin INTEGER, auditParamsValues TEXT,auditParamsTransaction TEXT, inspectionBy TEXT,status INTEGER,response TEXT,userId INTEGER,insFrom INTEGER)",);
        // pm_History Table
        await db.execute("CREATE TABLE PMHistory(id INTEGER PRIMARY KEY AUTOINCREMENT,auditSchduleId INTEGER,assetTagId INTEGER,auditName TEXT, auditInspectionDate TEXT , auditResult TEXT )",);
        // Accessories Table
        await db.execute("CREATE TABLE Accessories(id INTEGER PRIMARY KEY AUTOINCREMENT,aId INTEGER,name TEXT, image TEXT, category TEXT, manufacturer TEXT,location TEXT, minQty INTEGER, avlQty INTEGER)");
        // Consumable Table
        await db.execute("CREATE TABLE Consumable(id INTEGER PRIMARY KEY AUTOINCREMENT,cId INTEGER,name TEXT NOT NULL, image TEXT, category TEXT, orderNumber TEXT, location TEXT, minQty INTEGER, qty INTEGER, avlQty INTEGER)");
        // Licences Table
        await db.execute("CREATE TABLE Licences(id INTEGER PRIMARY KEY AUTOINCREMENT,lId INTEGER,name TEXT NOT NULL, expDate TEXT, freeSeatsCount TEXT, seats TEXT, manufacturer TEXT)");
        // Components Table
        await db.execute("CREATE TABLE Components(id INTEGER PRIMARY KEY AUTOINCREMENT,cId INTEGER,name TEXT NOT NULL, image TEXT, location TEXT, minQty INTEGER, avlQty INTEGER)");
        // Kits Table
        await db.execute("CREATE TABLE Kits(id INTEGER PRIMARY KEY AUTOINCREMENT,kId INTEGER,name TEXT NOT NULL)");
        // AssetStatus Table
        await db.execute("CREATE TABLE AssetStatus(id INTEGER PRIMARY KEY AUTOINCREMENT,asId INTEGER,name TEXT NOT NULL, companyId INTEGER ,userId INTEGER ,image TEXT, modelName TEXT, assetTag TEXT , location TEXT , lastAuditDate TEXT , status TEXT , companyName TEXT, categoryName TEXT, purchaseDate TEXT, supplierName TEXT, warrantyMonths INTEGER, assetStatus INTEGER)",);
        // Category Table
        await db.execute("CREATE TABLE Category(id INTEGER PRIMARY KEY AUTOINCREMENT,cId INTEGER,name TEXT)");
        // CategoryModels Table
        await db.execute("CREATE TABLE CategoryModels(id INTEGER PRIMARY KEY AUTOINCREMENT,cmId INTEGER,name TEXT ,catId INTEGER ,catName TEXT )");

        // Inspected Schedule Table
        await db.execute("CREATE TABLE InspectedSchedule(id INTEGER PRIMARY KEY AUTOINCREMENT,auditSchduleId INTEGER ,assetTagId INTEGER ,auditName TEXT,auditStatus TEXT, image TEXT, modelName TEXT, assetTag TEXT, location TEXT, auditEndDate DATETIME, scheduleExpireDate DATETIME, escalatedAuditLevels TEXT, maintenanceType TEXT, companyName TEXT, categoryName TEXT, purchaseDate TEXT,lastAuditDate DATETIME,auditInspectionDate DATETIME,auditInspectionDateF DATETIME, supplierName TEXT, warrantyMonths INTEGER,canCheckout INTEGER,canCheckin INTEGER, auditParamsValues TEXT,auditParamsTransaction TEXT, inspectionBy TEXT,status INTEGER,response TEXT,userId INTEGER)",);
        // schedule inspection data
        /// need to add new columns sync_status(0=not sync,1=sync,2=error) and comment
        await db.execute("CREATE TABLE InspectionData(id INTEGER PRIMARY KEY AUTOINCREMENT,data TEXT NOT NULL,images TEXT,assetImage TEXT)");
      },
    );
    return db;
  }

  // // Insert schedule on database
  // insertPreventiveSchedule(Preventive schedule) async {
  //   await deleteAllPreventiveSchedule();
  //   final db = await _db;
  //   final res = await db!.insert('Schedule', schedule.toJson());
  //   return res;
  // }
  //
  // // Delete all schedule
  // Future<int> deleteAllPreventiveSchedule() async {
  //   final db = await _db;
  //   final res = await db!.rawDelete('DELETE FROM Schedule');
  //   return res;
  // }
}
