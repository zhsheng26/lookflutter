import 'package:flutter/material.dart';

import 'RandomWords.dart';

void main() => runApp(WeApp());

class WeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeLook",
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: HomeMenu(),
      routes: {
        "randomWord": (context) => RandomWords(),
      },
    );
  }
}

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Summary")),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("randomWord");
                },
                child: Text("RandomWord"),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Learn"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
