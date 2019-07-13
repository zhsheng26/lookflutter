import 'package:flutter/material.dart';

import 'RandomWords.dart';

void main() => runApp(WeApp());

class WeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WeLook",
        theme: ThemeData(primaryColor: Colors.deepOrange),
        home: RandomWords());
  }
}
