// 2. Photo Local Data Source

import 'package:flutter_lab_assignment_3/data/models/photo_hive_model.dart';
import 'package:hive/hive.dart';

class PhotoLocalDataSource {
  final Box<PhotoModel> photoBox;

  PhotoLocalDataSource(this.photoBox);

  Future<void> cachePhotos(List<PhotoModel> photos) async {
    await photoBox.clear();
    for (var photo in photos) {
      await photoBox.put(photo.id, photo);
    }
  }

  List<PhotoModel> getPhotosByAlbum(int albumId) {
    return photoBox.values.where((p) => p.albumId == albumId.toString()).toList();
  }
}
