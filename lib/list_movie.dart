import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

Future<Map> getJson() async {
  await http.get("");
}

class MovieListState extends State<MovieList> {
  Color themeColor = const Color(0xff3c3261);
  var movies;

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.bold),
        ),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ),
        actions: <Widget>[
          Icon(
            Icons.menu,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieTitle(themeColor),
            Expanded(
              child: ListView.builder(itemBuilder: (context, i) {
                return FlatButton(
                  child: MovieCell(movies, i),
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MovieTitle extends StatelessWidget {
  Color themeColor;

  MovieTitle(this.themeColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Text(
        "Top Rated",
        style: TextStyle(
          color: themeColor,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  static const image_url = "https://image.tmdb.org/t/p/w500/";

  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                margin: EdgeInsets.all(14),
                child: Container(
                  width: 70,
                  height: 70,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(image_url + movies[i]['poster_path']),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 5,
                      offset: Offset(2, 5),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movies[i]['title'],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                    ),
                    Text(
                      movies[i]['overview'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
