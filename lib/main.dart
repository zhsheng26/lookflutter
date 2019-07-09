import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(WeApp());

class WeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WeLook",
        theme: ThemeData(primaryColor: Colors.deepOrange),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("word list"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _navSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _navSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final Iterable<ListTile> titleItems = _saved.map((pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final List<Widget> list = ListTile.divideTiles(
              context: context, tiles: titleItems, color: Colors.blue)
          .toList();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
        ),
        body: ListView(children: list),
      );
    }));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index], i);
        });
  }

  Widget _buildRow(WordPair pair, int i) {
    var alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase + "---" + i.toString(),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        //调用 setState() 会为 State 对象触发 build() 方法，从而导致对 UI 的更新
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
