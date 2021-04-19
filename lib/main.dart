import 'package:flutter/material.dart';

void main() {
  runApp(new MySuperAwesomeApp());
}

class MySuperAwesomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Fetch App'),
      ),
      body: Text("Future Builder widget goes here"),
    );
  }
}
