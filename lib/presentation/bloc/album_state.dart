import 'package:flutter_lab_assignment_3/domain/ entities/Albumentites.dart';
import 'package:flutter_lab_assignment_3/domain/ entities/Photoentities.dart';

abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Albumentites> albums;
  AlbumLoaded(this.albums);
}

class PhotosLoaded extends AlbumState {
  final List<Photoentities> photos;
  PhotosLoaded(this.photos);
}

class AlbumError extends AlbumState {
  final String message;
  AlbumError(this.message);
}
