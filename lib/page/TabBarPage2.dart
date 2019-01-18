import 'package:flutter/material.dart';
import 'package:video_app_flutter/tabpage/TabPage1.dart';
import 'package:video_app_flutter/tabpage/TabPage2.dart';
import 'package:video_app_flutter/tabpage/TabPage3.dart';

class TabBarPage2 extends StatefulWidget {
  TabBarPage2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TabBarPageState createState() => new _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage2> with SingleTickerProviderStateMixin{
  TabController controller;
  int _tabIndex = 0; //索引
  final titleLists = ["新闻", "资讯", "美女"]; //文字
  var imageLists = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(
      Icons.person,
    )
  ]; //图标

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _body = TabBarView(
      children: <Widget>[TabPage1(), TabPage2(), TabPage3()],
      controller: controller,
    );
    //  IndexedStack中可以有多个子组件，根据索引值来显示其中某个组件而隐藏其余的组件。
    return Scaffold(
      appBar: AppBar(
        title: Text(titleLists[_tabIndex]),
        bottom:TabBar(
          controller : controller,tabs: getBottomNavItems(),
        )
      ),
      body: _body,
      // bottomNavigationBar属性为页面底部添加导航的Tab
    );
  }

  //底部导航组件
  List<Tab> getBottomNavItems() {
    List<Tab> lists = new List();
    for (int i = 0; i < 3; i++) {
      lists.add(new Tab(text:titleLists[i]));
    }
    print(lists);
    return lists;
  }
}
