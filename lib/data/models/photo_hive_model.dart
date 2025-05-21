

import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';
import 'package:hive/hive.dart';

part 'photo_hive_model.g.dart';

@HiveType(typeId: 1)
class PhotoModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String albumId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String thumbnailUrl;

  PhotoModel({required this.id, required this.albumId, required this.title, required this.url, required this.thumbnailUrl});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'].toString(),
      albumId: json['albumId'].toString(),
      title: json['title'] ?? "",
      url: json['url'] ?? "",
      thumbnailUrl: json['thumbnailUrl'] ?? "",
    );
  }

  Photoentities toEntity() {
    return Photoentities(
      id: id,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
      albumId: albumId,
    );
  }
}