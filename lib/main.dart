import 'package:flutter/material.dart';

import 'custom_widgets/album_actions.dart';

void main() {
  runApp(MySuperAwesomeApp());
}

class MySuperAwesomeApp extends StatefulWidget {
  @override
  _MySuperAwesomeAppState createState() => _MySuperAwesomeAppState();
}

class _MySuperAwesomeAppState extends State<MySuperAwesomeApp> {
  /* 
  This bypasses Flutter's null safety and lazy loads until its called again.
  For some reason, late keyword throws when used.  
  */
  Future<Album> futureAlbum;

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
