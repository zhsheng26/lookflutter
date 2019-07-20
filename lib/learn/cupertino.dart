import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneCupertinoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OneCupertinoState();
  }
}

class OneCupertinoState extends State<OneCupertinoWidget> {
  String content = "hello";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(80),
            ),
            Text(
              content,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red[200],
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            CupertinoButton(
              color: Colors.blue,
              pressedOpacity: 0.8,
              child: Text("Greet"),
              onPressed: () {
                setState(() {
                  content = content + "world";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
