import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';
import 'package:flutter_lab_assignment_3/domain/%20repositories/album_repository.dart';

class Albumusecase {
  final AlbumRepository albumRepository;
  Albumusecase({required this.albumRepository});
Future<List<Albumentites>> getAllAlbums()async{
   return await albumRepository.getAllAlbums();
}
  

  Future<List<Photoentities>>getPhotosByAlbum(String albumId) async {
    return await albumRepository.getPhotosByAlbum(albumId);
  }

  Future<Albumentites> getsingleAlbum(String id) async {
    return await albumRepository.getSingleAlbum(id);
  }

  
  
}
