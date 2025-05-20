import 'package:flutter_lab_assignment_3/data/models/PhotoModel.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/db_helper.dart';
import 'package:sqflite/sqflite.dart';


class PhotoLocalDataSource {
  final dbHelper = DBHelper();

  Future<void> cachePhotos(List<PhotoModel> photos) async {
    final db = await dbHelper.database;

    for (var photo in photos) {
      await db.insert('photos', {
        'id': photo.id,
        'albumId': photo.albumId,
        'title': photo.title,
        'url': photo.url,
        'thumbnailUrl': photo.thumbnailUrl,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<PhotoModel>> getPhotosByAlbum(String  albumId) async {
    final db = await dbHelper.database;
    final result = await db.query(
      'photos',
      where: 'albumId = ?',
      whereArgs: [albumId],
    );

    return result.map((json) => PhotoModel.fromJson(json)).toList();
  }
}
