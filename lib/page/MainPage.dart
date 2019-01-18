import 'package:flutter/material.dart';
import 'package:video_app_flutter/page/ListPage.dart';
import 'package:video_app_flutter/page/MyHomePage.dart';
import 'package:video_app_flutter/page/TabBarPage.dart';
import 'package:video_app_flutter/page/TabBarPage2.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),

      ///侧滑菜单栏
      drawer: Drawer(
        child: Center(
          child: Text("侧滑栏"),
        ),
      ),

      ///内容区域
      body: Container(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: getPageList(),mainAxisSize: MainAxisSize.max,
          ),
      ),
//      bottomNavigationBar: Cupy,
    );
  }

   getPageList(){
    var pageTitle = ["简单布局","底部导航","顶部导航","List列表"];
    var page = [MyHomePage(title: "简单布局"),TabBarPage(),TabBarPage2(),ListPage(title: "List列表",)];
    List<Widget> pageLists = List();
    for(int i=0;i<page.length;i++){
      pageLists.add(
        Card(
          child: FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return page[i];
            }));
          }, child: Text(pageTitle[i])),
        )
      );
    }
    return pageLists;
  }
}
