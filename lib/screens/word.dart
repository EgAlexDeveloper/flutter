import 'package:flutter/material.dart';

class Word extends StatefulWidget {
  final String value;

  Word({Key key, this.value}) : super(key: key);

  @override
  _WordPageState createState() => new _WordPageState();
}

class _WordPageState extends State<Word> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Word Page"),
      ),
      body: Center(
        child: Text("${widget.value}", style: TextStyle(fontSize: 22.0)),
      ),
    );
  }
}
