import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// our fetch method
Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));

  if (response.statusCode == 200) {
    return sanitizeUsers(jsonDecode(response.body));
  } else {
    throw Exception("Error getting users.");
  }
}

// create a function that accepts a List of objects and returns a mapped list of
// user instances.
List<User> sanitizeUsers(List<Map<String, dynamic>> users) {
  late List<User> userList = [];
  userList.length = users.length;

  users.forEach((user) {
    userList.add(User.fromJson(jsonDecode(user)));
  });

  return userList;
}

// Our User Class
class User {
  final int userId;
  final String userName;
  final String userEmail;

  User({required this.userId, required this.userName, required this.userEmail});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      userEmail: json['email'],
      userName: json['username'],
      userId: json['id'],
    );
  }
}
