import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class ListPage extends StatefulWidget{
  final String title;
  ListPage({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: getBody(),
    );
  }
  //内容
  getBody(){

  }

}