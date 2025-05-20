import 'package:flutter_lab_assignment_3/data/%20data_sources/album_api_service.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';
import 'package:flutter_lab_assignment_3/domain/%20repositories/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumApiService albumApiService;

  AlbumRepositoryImpl({required this.albumApiService});

  @override
  Future<List<Albumentites>> getAllAlbums() async {
    final albums = await albumApiService.getAlbums();
    return albums.map((a) => a.toEntity()).toList();
  }

  @override
  Future<List<Photoentities>> getAllPhotos() async {
    final photos = await albumApiService.getAllPhotos();
    return photos.map((p) => p.toEntity()).toList();
  }

  @override
  Future<Photoentities> getPhotosByAlbumId(String albumId) async {
    final photos = await albumApiService.getPhotosByAlbumId(albumId);
    final photo = photos.firstWhere((a) => a.id == albumId);
    return photo.toEntity();
  }
}
