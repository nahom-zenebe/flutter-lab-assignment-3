
import 'package:flutter_lab_assignment_3/domain/%20entities/Albumentites.dart';
import 'package:hive/hive.dart';

part 'Album_hive_model.g.dart';

@HiveType(typeId: 0)
class AlbumModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userId;
  @HiveField(2)
  final String title;

  AlbumModel({required this.id, required this.userId, required this.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      title: json['title'] ?? "",
    );
  }

  Albumentites toEntity() {
    return Albumentites(id: id, userId: userId, title: title);
  }
}
