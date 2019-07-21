import 'package:flutter/widgets.dart';

import 'learn/base_widget.dart';
import 'learn/cupertino.dart';
import 'learn/list_movie.dart';
import 'learn/list_page.dart';
import 'learn/random_words.dart';

Map<String, WidgetBuilder> routes = {
  "/randomWord": (context) => RandomWords(),
  "/list_page": (context) => ListArgumentWidget(),
  "/cupertino": (context) => OneCupertinoWidget(),
  "/base_widget": (context) => BaseWidget(),
  "/movie": (context) => MovieList(),
};
