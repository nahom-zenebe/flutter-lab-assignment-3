import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';

abstract class AlbumRepository {
  Future<List<Albumentites>> getallAlbum();
  Future<List<Photoentities>> getallphoto();
  Future<Albumentites> getsingleAlbum(String id);
  Future<Photoentities> getsinglephoto(String id);
}
