import 'dart:convert';
import 'package:http/http.dart' as http;

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;
  final String url;

  Photo(
      {required this.id,
      required this.title,
      required this.thumbnailUrl,
      required this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      url: json['url'],
    );
  }
}

class PhotoService {
  static const String _url = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Photo.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
