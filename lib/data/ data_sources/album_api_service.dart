import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_lab_assignment_3/data/models/Album_hive_model.dart';
import 'package:flutter_lab_assignment_3/data/models/photo_hive_model.dart';

class AlbumApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  final http.Client httpClient;

  AlbumApiService({required this.httpClient});

  Future<List<AlbumModel>> getAlbums() async {
    final response = await httpClient.get(Uri.parse('$baseUrl/albums'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => AlbumModel.fromJson(json)).toList();
    }
    throw Exception('Failed to load albums');
  }

  Future<List<PhotoModel>> getAllPhotos() async {
    final response = await httpClient.get(Uri.parse('$baseUrl/photos'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PhotoModel.fromJson(json)).toList();
    }
    throw Exception('Failed to load photos');
  }

  Future<List<PhotoModel>> getPhotosByAlbumId(String albumId) async {
    final response = await httpClient.get(Uri.parse('$baseUrl/albums/$albumId/photos'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PhotoModel.fromJson(json)).toList();
    }
    throw Exception('Failed to load photos for album $albumId');
  }
}