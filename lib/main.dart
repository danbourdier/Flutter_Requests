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
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Our Fetch App'),
            ),
            body: Center(
              // To test different endpoints, just switch any mention of Album class
              // and respective variables with User class data.
              child: FutureBuilder<List<User>>(
                future: futureUsers, // this accepts our async result
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data![index].userEmail);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // if (snapshot.hasData) {
                  //   return Text(snapshot.data!.title);
                  // } else if (snapshot.hasError) {
                  //   return Text("${snapshot.error}");
                  // }

                  return CircularProgressIndicator();
                },
              ),
            )));
  }
}
