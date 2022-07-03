import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/contact_custom.dart';

class ContactsDatabase {
  static final ContactsDatabase instance = ContactsDatabase._init();
  static Database? _database;
  ContactsDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('contact.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final nameType = 'TEXT NOT NULL';
    final mobileType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableContact(
  ${ContactFields.id} $idType,
  ${ContactFields.name} $nameType,
  ${ContactFields.mobile} $mobileType
)
''');
  }

  Future<Contact> create(Contact contact) async {
    final db = await instance.database;
    final id = await db.insert(tableContact, contact.toJson());
    return contact.copy(id: id);
  }

  Future<Contact> readContact(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableContact,
      columns: ContactFields.values,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Contact.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Contact>> readAllContact() async {
    final db = await instance.database;
    final orderBy = '${ContactFields.id} DESC';
    final result = await db.query(tableContact, orderBy: orderBy);
    return result.map((json) => Contact.fromJson(json)).toList();
  }

  Future<int> update(Contact contact) async {
    final db = await instance.database; // อ้างอิงฐานข้อมูล

    // คืนค่าเป็นตัวเลขจำนวนรายการที่มีการเปลี่ยนแปลง
    return db.update(
      tableContact,
      contact.toJson(),
      where: '${ContactFields.id} = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database; // อ้างอิงฐานข้อมูล

    // คืนค่าเป็นตัวเลขจำนวนรายการที่มีการเปลี่ยนแปลง
    return db.delete(
      tableContact,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await instance.database; // อ้างอิงฐานข้อมูล
    // คืนค่าเป็นตัวเลขจำนวนรายการที่มีการเปลี่ยนแปลง
    return db.delete(
      tableContact,
    );
  }

  Future close() async {
    final db = await instance.database; // อ้างอิงฐานข้อมูล

    db.close();
  }
}
