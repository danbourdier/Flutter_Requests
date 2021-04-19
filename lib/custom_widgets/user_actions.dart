import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// our fetch method

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
