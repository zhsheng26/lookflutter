import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(WeApp());

class WeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WeLook",
        theme: ThemeData(primaryColor: Colors.deepOrange),
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text("hello one"),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ThreeWidget();
            },
            itemCount: 20,
          ),
        ));
  }
}
