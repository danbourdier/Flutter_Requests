import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MySuperAwesomeApp());
}

class MySuperAwesomeApp extends StatefulWidget {
  @override
  _MySuperAwesomeAppState createState() => _MySuperAwesomeAppState();
}

class _MySuperAwesomeAppState extends State<MySuperAwesomeApp> {
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
