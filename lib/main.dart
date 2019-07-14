import 'package:flutter/material.dart';

import 'cupertino.dart';
import 'list_page.dart';
import 'login.dart';
import 'random_words.dart';
import 'base_widget.dart';

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
        "list_page": (context) => ListArgumentWidget(),
        "cupertino": (context) => OneCupertinoWidget(),
        "base_widget": (context) => BaseWidget(),
        "login": (context) => LoginWidget(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("randomWord");
                },
                child: Text(
                  "RandomWord",
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10.0)),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("list_page", arguments: 5);
                },
                child: Text("Learn"),
              ),
              Padding(padding: EdgeInsets.only(left: 10.0)),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("cupertino");
                },
                child: Text("cupertino"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("base_widget");
                },
                child: Text("基础组件"),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                child: Text("登录"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
