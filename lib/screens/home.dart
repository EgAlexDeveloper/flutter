import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './word.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final List<WordPair> _suggestions = <WordPair>[];
    final Set<WordPair> _saved = new Set<WordPair>();
    final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

    void _pushSaved(pair) {
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new Word(value: pair),
      );
      Navigator.of(context).push(route);
    }

    _buildRow(WordPair pair) {
      final bool alreadySaved = _saved.contains(pair);
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          return _pushSaved(pair.asPascalCase);
        },
      );
    }

    _buildSuggestions() {
      return new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext _context, int i) {
            if (i.isOdd) {
              return new Divider();
            }
            final int index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          // Add 3 lines from here...
          // new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
