import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';

abstract class AlbumRepository {
Future<List<Albumentites>> getAllAlbums();
  Future<List<Photoentities>> getPhotosByAlbum(String albumId);
  Future<Albumentites> getSingleAlbum(String albumId);
}
