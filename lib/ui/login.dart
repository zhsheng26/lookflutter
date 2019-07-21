import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginWidget> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _userName = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  String name = "";
  String pwd = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("登录"),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey,
//          autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _userName,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "请输入用户名",
                    icon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能是空";
                  },
                ),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能小于6位";
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                              setState(() {
                                name = _userName.text;
                                pwd = _password.text;
                              });
                            }
                          },
                          child: Text(
                            "登录",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                Text(name),
                Text(pwd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
