import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //标题
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //
      body:  Container(
        child:  Card(
          child:  FlatButton(
            onPressed: () {
              print("点击事件");
            },
            child:  Padding(
              padding:
               EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Container(
                    child:  Text(
                      "这是描述哦",
                      style:  TextStyle(color: Colors.blue, fontSize: 18),

                      ///最长三行，超过 ... 显示
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                   Padding(padding:  EdgeInsets.all(10.0)),
                   Row(
                    children: <Widget>[
                      _getBottomItem(Icons.favorite_border, "2000"),
                      _getBottomItem(Icons.call, "100"),
                      _getBottomItem(Icons.album, "2222")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getBottomItem(IconData icon, String text) {
    return  Expanded(
        flex: 1,
        child:  Center(
          //水平布局
          child:  Row(
            //设置各个属性
            //主轴居中，即横向居中
            mainAxisAlignment: MainAxisAlignment.center,
            //大小按照最大充满
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center, //竖直居中
            //开始添加组件
            children: <Widget>[
               Icon(
                icon,
                size: 16.0,
                color: Colors.grey,
              ),
               Padding(padding:  EdgeInsets.all(10)),
               Text(
                text,
                style:  TextStyle(color: Colors.black, fontSize: 18.0),
                //超过的显示为....
                overflow: TextOverflow.ellipsis,
                //最大行数
                maxLines: 1,
              )
            ],
          ),
        ));
  }
}