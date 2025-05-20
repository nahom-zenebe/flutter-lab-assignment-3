import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class AlbumModel {
  final   String id;
  final String userId;
  final String title;

  AlbumModel({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      title: json['title'] ?? "",
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
