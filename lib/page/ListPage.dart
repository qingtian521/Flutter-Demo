import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:video_app_flutter/Utils.dart';

class ListPage extends StatefulWidget {
  final String title;
  ListPage({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    _suggestions.addAll(generateWordPairs().take(10));
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: _buildSuggestions(),
    );
  }

  //内容
  _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, i) {
          return _itemWidget(i);
        });
  }

  _itemWidget(int i) {
    return GestureDetector(
      child: Card(
          child: Container(
            child: Text(
              _suggestions[i].asString,
              style: _biggerFont,
            ),
            padding: const EdgeInsets.all(16.0),
          )
      ),
      onTap: (){
        showDialog(context: context,
        builder: (BuildContext context){
          return Utils.getDialog(i.toString(),context);
        }
        );
      },
    );
  }

  getDialog(index){
    return AlertDialog(
      title: Text("点击提示"),
      content: SingleChildScrollView(
        child: new ListBody(children: <Widget>[new Text("你点击了Item" + index.toString() + _suggestions[index].asString)]),
      ),
      actions: <Widget>[
        FlatButton(onPressed: () {Navigator.of(context).pop();},
          child: Text("取消"),
        ),
        FlatButton(onPressed: () {Navigator.of(context).pop();},
          child: Text("确定"),
        )
      ],
    );
  }
}
