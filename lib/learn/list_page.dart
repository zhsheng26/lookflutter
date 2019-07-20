import 'package:flutter/material.dart';

class ListArgumentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page Layout"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ThreeWidget();
        },
        itemCount: args,
      ),
    );
  }
}

class ThreeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ThreeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: FlatButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.only(
                left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    child: new Text(
                      "这是一点描述",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14.0,
                      ),

                      ///最长三行，超过 ... 显示
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                    alignment: Alignment.topLeft),
                new Padding(padding: EdgeInsets.all(10.0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getBottomItem(Icons.star, "star"),
                    _getBottomItem(Icons.star, "star"),
                    _getBottomItem(Icons.star, "star"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBottomItem(IconData icon, String text) {
    ///充满 Row 横向的布局
    return new Expanded(
      flex: 1,

      ///居中显示
      child: new Center(
        ///横向布局
        child: new Row(
          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,

          ///大小按照最大充满
          mainAxisSize: MainAxisSize.max,

          ///竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///一个图标，大小16.0，灰色
            new Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),

            ///间隔
            new Padding(padding: new EdgeInsets.only(left: 5.0)),

            ///显示文本
            new Text(
              text,
              //设置字体样式：颜色灰色，字体大小14.0
              style: new TextStyle(color: Colors.grey, fontSize: 14.0),
              //超过的省略为...显示
              overflow: TextOverflow.ellipsis,
              //最长一行
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
