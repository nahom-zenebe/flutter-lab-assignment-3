import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';

abstract class AlbumRepository {
  Future<List<Albumentites>> getallAlbum();
  Future<List<Photoentities>> getallphoto();
}
