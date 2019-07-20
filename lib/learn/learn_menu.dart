import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LearnMenuWidget extends StatelessWidget {
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
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "movie");
                },
                child: Text("movie"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
