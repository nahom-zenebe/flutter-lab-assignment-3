import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/domain/usecase/Albumusecase.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final Albumusecase usecase;

  AlbumBloc(this.usecase) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await usecase.getAllAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });

    on<FetchPhotosByAlbumId>((event, emit) async {
      emit(AlbumLoading());
      try {
        final photos = await usecase.getAllPhotos();
        final filtered = photos.where((p) => p.albumId.toString() == event.albumId).toList();
        emit(PhotosLoaded(filtered));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });
  }
}
