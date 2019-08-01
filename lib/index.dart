import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookflutter/ui/home.dart';

import 'learn/learn_menu.dart';
import 'ui/discovery.dart';
import 'ui/look.dart';
import 'ui/mine.dart';
import 'util/constants.dart';

class IndexWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<IndexWidget> {
  PageController _pageController;
  int _page = 0;

  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
    _pageController = PageController(initialPage: _page);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.blue,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            HomeWidget(),
            LookWidget(),
            DiscoveryWidget(),
            MineWidget(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
            primaryColor: Theme.of(context).accentColor,
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.wallpaper),
                title: Text("微观"),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.piedPiper),
                title: Text("订阅"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                title: Text("发现"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Boxicons.bxUser),
                title: Text("我"),
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return LearnMenuWidget();
              }),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
