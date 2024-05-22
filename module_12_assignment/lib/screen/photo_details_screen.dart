import 'package:flutter/material.dart';
import 'package:module_12_assignment/modal/photo_service.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(photo.url),
            const SizedBox(height: 16.0),
            Text(photo.title, style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 8.0),
            Text('ID: ${photo.id}', style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
