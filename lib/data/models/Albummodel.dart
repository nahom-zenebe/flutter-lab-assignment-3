import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';

class AlbumModel {
  final int id;
  final int userId;
  final String title;

  AlbumModel({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
    );
  }

  // Convert DTO to Entity
  Albumentites toEntity() {
    return  Albumentites(
      id: id,
      userId: userId,
      title: title,
    );
  }
}
