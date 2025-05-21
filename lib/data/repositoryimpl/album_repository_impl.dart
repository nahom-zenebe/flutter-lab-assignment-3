import 'package:flutter_lab_assignment_3/data/%20data_sources/album_api_service.dart';
import 'package:flutter_lab_assignment_3/data/%20data_sources/album_local_datasource.dart';
import 'package:flutter_lab_assignment_3/data/%20data_sources/photo_local_datasource.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';
import 'package:flutter_lab_assignment_3/domain/%20repositories/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumApiService albumApiService;
  final AlbumLocalDataSource localAlbum;
  final PhotoLocalDataSource localPhoto;

  AlbumRepositoryImpl({required this.albumApiService, required this.localAlbum, required this.localPhoto});

  @override
  Future<List<Albumentites>> getAllAlbums() async {
    try {
      final remoteAlbums = await albumApiService.getAlbums();
      await localAlbum.cacheAlbums(remoteAlbums);
      return remoteAlbums.map((e) => e.toEntity()).toList();
    } catch (_) {
      final cachedAlbums = localAlbum.getCachedAlbums();
      return cachedAlbums.map((e) => e.toEntity()).toList();
    }
  }

  @override
  Future<List<Photoentities>> getAllPhotos() async {
    try {
      final remotePhotos = await albumApiService.getAllPhotos();
      return remotePhotos.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }

  @override
  Future<Photoentities> getPhotosByAlbumId(String albumId) async {
    try {
      final remotePhotos = await albumApiService.getPhotosByAlbumId(albumId);
      return remotePhotos.first.toEntity();
    } catch (e) {
      throw Exception('Failed to load photos for album $albumId: $e');
    }
  }
}