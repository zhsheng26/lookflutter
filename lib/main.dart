import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lookflutter/learn/learn_menu.dart';

import 'learn/cupertino.dart';
import 'learn/random_words.dart';
import 'learn/list_movie.dart';
import 'learn/list_page.dart';
import 'learn/login.dart';
import 'learn/base_widget.dart';

void main() => runApp(MaterialApp(
      home: SplashWidget(),
    ));

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => WeApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Image.asset(
                  'assets/images/splash.png',
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 120.0),
                child: Text(
                  "powered by flutter",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeLook",
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: LearnMenuWidget(),
      routes: {
        "randomWord": (context) => RandomWords(),
        "list_page": (context) => ListArgumentWidget(),
        "cupertino": (context) => OneCupertinoWidget(),
        "base_widget": (context) => BaseWidget(),
        "login": (context) => LoginWidget(),
        "movie": (context) => MovieList(),
      },
    );
  }
}
