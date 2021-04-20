import 'package:flutter/material.dart';

import 'custom_widgets/album_actions.dart';
import 'custom_widgets/user_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /* 
  This bypasses Flutter's null safety and lazy loads until its called again.
  For some reason, late keyword throws when used.  
  */
  late Future<Album> futureAlbum;
  late Future<User> futureUsers;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Our Fetch App'),
            ),
            body: Center(
              child: FutureBuilder<Album>(
                future: futureAlbum, // this accepts our async result
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              ),
            )));
  }
}
