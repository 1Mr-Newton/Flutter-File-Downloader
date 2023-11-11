import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'downloader_test.db');
  return openDatabase(path, version: 1, onCreate: _createDatabase);
}

void _createDatabase(Database db, int version) async {
  await db.execute('''
    CREATE TABLE DownloadItem(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      uid String UNIQUE,
      downloadURL TEXT ,
      filepath TEXT ,
      thumbnailURL TEXT ,
      thumbnailPath TEXT ,
      fileType String,
      size String,
      originalURL TEXT,
      site String,
      status String,
      taskId String,
      filename String ,
      thumbnailFilename String ,
      progress Integer
    )
  ''');
}

Future<List<Map<String, dynamic>>> loadData() async {
  var database = await initDatabase();
  var allData =
      await database.query('DownloadItem', orderBy: 'created_at DESC');

  return allData;
}

Future<List<Map<String, dynamic>>> loadSiteHistory(String siteName) async {
  var database = await initDatabase();
  var allData = await database.query('DownloadItem',
      where: 'site = ?', whereArgs: [siteName], orderBy: 'created_at DESC');

  return allData;
}

Future<void> deleteDatabaase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'downloader_test.db');

  // Check if the database file exists before deleting
  bool exists = await databaseExists(path);
  if (exists) {
    await deleteDatabase(path);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory allMediaDownloaderDir =
        Directory('${appDocDir.path}/allmediadownloader');

    if (await allMediaDownloaderDir.exists()) {
      allMediaDownloaderDir.deleteSync(recursive: true);
    }
  } else {
    print('Guy, the db no exist oo');
  }
}

// query data by uid
Future<List<Map<String, dynamic>>> queryDataByUid(String uid) async {
  var database = await initDatabase();
  var allData =
      await database.query('DownloadItem', where: 'uid = ?', whereArgs: [uid]);

  return allData;
}

// insert data function, datas a map of data
Future<bool> saveDownloadItem(Map<String, dynamic> data) async {
  var database = await initDatabase();
  await database.insert('DownloadItem', data).then((value) {
    return true;
  }).catchError((error) {
    return false;
  });
  return false;
}

// update data function, datas a map of data
Future<void> updateData(String uid, Map<String, dynamic> data) async {
  var database = await initDatabase();
  await database
      .update('DownloadItem', data, where: 'uid = ?', whereArgs: [uid]);
}

Future<bool> deleteOne(String uid) async {
  var database = await initDatabase();
  int counts =
      await database.delete("DownloadItem", where: "uid = ?", whereArgs: [uid]);
  return counts == 1;
}

Future<void> deleteDownloadItem(String link) async {
  try {
    // Call your existing deleteOne function with the link attribute
    var database = await initDatabase();
    int counts = await database
        .delete("DownloadItem", where: "downloadURL = ?", whereArgs: [link]);

    if (counts == 1) {
      print('Entry deleted successfully from the database.');
    } else {
      print('Failed to delete entry from the database.');
    }
  } catch (error) {
    print('Error deleting entry from the database: $error');
  }
}
