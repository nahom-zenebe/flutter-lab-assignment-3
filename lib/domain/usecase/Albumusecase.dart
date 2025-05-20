import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';
import 'package:flutter_lab_assignment_3/domain/%20repositories/album_repository.dart';

class Albumusecase {
  final AlbumRepository albumRepository;
  Albumusecase({required this.albumRepository});
Future<List<Albumentites>> getAllAlbums()async{
   return await albumRepository.getAllAlbums();
}
  

  Future<List<Photoentities>>getAllPhotos() async {
    return await albumRepository.getAllPhotos();
  }

  Future<Photoentities> getPhotosByAlbumId(String albumId) async {
    return await albumRepository.getPhotosByAlbumId(albumId);
  }

  
  
}
