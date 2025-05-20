abstract class AlbumEvent {}

class FetchAlbums extends AlbumEvent {}

class FetchPhotosByAlbumId extends AlbumEvent {
  final String albumId;
  FetchPhotosByAlbumId(this.albumId);
}
