import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';
import 'package:flutter_lab_assignment_3/domain/%20repositories/album_repository.dart';

class Albumusecase {
  final AlbumRepository albumRepository;
  Albumusecase({required this.albumRepository});

  Future<List<Albumentites>> getallAlbum() async {
    return await albumRepository.getallAlbum();
  }

  Future<List<Photoentities>> getallphoto() async {
    return await albumRepository.getallphoto();
  }

  Future<Albumentites> getsingleAlbum(String id) async {
    return await albumRepository.getsingleAlbum(id);
  }

  Future<Photoentities> getsinglephoto(String id) async {
    return await albumRepository.getsinglephoto(id);
  }
}
