import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_lab_assignment_3/domain/%20entities/Photoentities.dart';


class PhotoCard extends StatelessWidget {
  final  Photoentities photo;
  final VoidCallback? onTap;

  const PhotoCard({Key? key, required this.photo, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Photo ID: ${photo.id} tapped")),
  );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: photo.thumbnailUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.broken_image,
                    size: 40,
                    color: Colors.grey,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  photo.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Row(
        children: [
          const Icon(Icons.album, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Text("Album ID: ${photo.albumId}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          const Icon(Icons.person, color: Colors.green),
          const SizedBox(width: 8),
          Text("User ID: ${photo.id}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],)]
              )],
              
          ),
        ),
      ),
    );
  }
}
