import 'package:flutter_lab_assignment_3/data/models/Albummodel.dart';
import 'package:flutter_lab_assignment_3/data/models/PhotoModel.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'album_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class AlbumApiService {
  factory AlbumApiService(Dio dio, {String baseUrl}) = _AlbumApiService;

  @GET("/albums")
  Future<List<AlbumModel>> getAlbums();

  @GET("/photos")
  Future<List<PhotoModel>> getPhotos();

  @GET("/photos")
  Future<List<PhotoModel>> getPhotosByAlbumId(@Query("albumId") String albumId);

}