import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础Widget"),
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性;这是文本属性的例子。TextStyle用于指定文本显示的样式如颜色、字体、粗细、背景等",
              style: TextStyle(
                color: Colors.blue,
                decorationStyle: TextDecorationStyle.wavy,
                decorationColor: Colors.red,
                decoration: TextDecoration.underline,
                fontSize: 14.0,
                height: 1.2, //具体的行高等于fontSize*height
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textScaleFactor:
                  1.2, //代表文本相对于当前字体大小的缩放因子,主要是用于系统字体大小设置改变时对Flutter应用字体进行全局调整，而fontSize通常用于单个文本，字体大小不会跟随系统字体大小变化
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Home: ",
                    style: TextStyle(backgroundColor: Colors.red[50]),
                  ),
                  TextSpan(
                    text: "https://www.baidu.com",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ],
                style: TextStyle(fontSize: 16.0),
              ),
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            DefaultTextStyle(
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 18,
                  decoration: TextDecoration.lineThrough),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Hello"),
                  Text(
                    "Hello",
                    style: TextStyle(
                        inherit: false, //不继承默认样式
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Text(
                "RaisedButton 即'漂浮'按钮，它默认带有阴影和灰色背景;\nFlatButton即扁平按钮，默认背景透明并不带阴影;\n"
                "OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱);\n"
                "IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景."),
            FlatButton(
              onPressed: () {},
              child: Text("FlatButton"),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              //按钮按下时的背景颜色
              splashColor: Colors.grey,
              //点击时，水波动画中水波的颜色
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              //按钮主题，默认是浅色主题
              colorBrightness: Brightness.dark, //为了保证按钮文字颜色为浅色
            ),
            //假若我们需要去除背景，则可以通过将背景颜色设置为全透明来实现。
            // 对应上面的代码，便是将 color: Colors.blue 替换为 color: Color(0x000000)

            RaisedButton(
              onPressed: () {},
              child: Text("RaiseButton"),
              color: Colors.red,
              elevation: 10.0,
              highlightElevation: 2.0,
              disabledElevation: 0.0,
            ),
            OutlineButton(
              child: Text("normal"),
              onPressed: () => {},
              highlightedBorderColor: Colors.red,
              borderSide: BorderSide(color: Colors.blue), //默认边框颜色
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              iconSize: 46,
              onPressed: () => {},
              color: Colors.red,
            )
          ],
        ),
      )),
    );
  }
}
