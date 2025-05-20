import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PhotoModel {
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;
  final String albumId;

  PhotoModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.albumId,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'].toString(),
      title: json['title'] ??" ",
      url: json['url'] ??" ",
      thumbnailUrl: json['thumbnailUrl'] ??" ",
      albumId: json['albumId'].toString(),
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
