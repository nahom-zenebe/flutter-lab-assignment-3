import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';

class PhotoModel {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  final int albumId;

  PhotoModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.albumId,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      albumId: json['albumId'] as int,
    );
  }

 
  Photoentities toEntity() {
    return Photoentities (
      id: id,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
      albumId: albumId,
    );
  }
}
