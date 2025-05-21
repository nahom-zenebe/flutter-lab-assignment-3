import 'package:flutter_lab_assignment_3/data/models/Album_hive_model.dart';
import 'package:hive/hive.dart';

class AlbumLocalDataSource {
  final Box<AlbumModel> albumBox;

  AlbumLocalDataSource(this.albumBox);

  Future<void> cacheAlbums(List<AlbumModel> albums) async {
    await albumBox.clear();
    for (var album in albums) {
      await albumBox.put(album.id, album);
    }
  }

  List<AlbumModel> getCachedAlbums() {
    return albumBox.values.toList();
  }
}
