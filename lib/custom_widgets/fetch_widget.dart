import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);
  
}
