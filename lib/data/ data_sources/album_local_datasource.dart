import 'package:flutter_lab_assignment_3/data/models/Albummodel.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/db_helper.dart';
import 'package:sqflite/sqflite.dart';


class AlbumLocalDataSource {
  final dbHelper = DBHelper();

  Future<void> cacheAlbums(List<AlbumModel> albums) async {
    final db = await dbHelper.database;

    for (var album in albums) {
      await db.insert('albums', {
        'id': album.id,
        'userId': album.userId,
        'title': album.title,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<AlbumModel>> getCachedAlbums() async {
    final db = await dbHelper.database;
    final result = await db.query('albums');

    return result.map((json) => AlbumModel.fromJson(json)).toList();
  }
}
