import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MySuperAwesomeApp());
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
}

class MySuperAwesomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Our Fetch App'),
      ),
      body: Text("Future Builder widget goes here"),
    ));
  }
}

/*

import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

}


*/
