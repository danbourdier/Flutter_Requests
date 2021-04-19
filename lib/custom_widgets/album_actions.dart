import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// This is a async method to fetch/get our resources (Album)
Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    /**
     * An alternative to creating an instance with the response and omitting #fromJson from Album
     * Map<String, dynamic> decodedJson = jsonDecode(response.body)
     * 
     * int resUserId = decodedJson['userId']
     * int resId = decodedJson['id']
     * String resTitle = decodedJson['title']
     */
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load album");
  }
}

// This constructs our instance of Album to use.
class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);
  /* Test a refactored version that doesn't require use of the factory keyword */
  factory Album.fromJson(Map<String, dynamic> json) {
    return new Album(json['userId'], json['id'], json['title']);
  }
}

