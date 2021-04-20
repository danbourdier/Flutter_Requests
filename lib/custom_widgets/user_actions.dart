import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// our fetch method
Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));

  if (response.statusCode == 200) {
    // calls #santizeUsers passing a deserialized list of objects.
    return sanitizeUsers(jsonDecode(response.body));
  } else {
    throw Exception("Error getting users.");
  }
}

// create a function that accepts a deserialized List of objects and returns a mapped list of
// user instances.
// List<User> sanitizeUsers(List<Map<String, dynamic>> users) {
List<User> sanitizeUsers(List<dynamic> users) {
  late List<User> userList = [];
  // userList.length = users.length;

  users.forEach((userObject) {
    userList.add(User.fromJson(userObject));
  });

  return userList;
}

// Our User Class
class User {
  final int userId;
  final String userName;
  final String userEmail;

  // generic constructor
  User({required this.userId, required this.userName, required this.userEmail});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      userEmail: json['email'],
      userName: json['username'],
      userId: json['id'],
    );
  }
}
