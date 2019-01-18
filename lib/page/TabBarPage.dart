import 'package:flutter/material.dart';
import 'package:video_app_flutter/tabpage/TabPage1.dart';
import 'package:video_app_flutter/tabpage/TabPage2.dart';
import 'package:video_app_flutter/tabpage/TabPage3.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TabBarPageState createState() => new _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _tabIndex = 0; //索引
  final titleLists = ["首页", "发现", "我的"]; //文字
  var imageLists = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(
      Icons.person,
    )
  ]; //图标
  @override
  Widget build(BuildContext context) {
    //  IndexedStack中可以有多个子组件，根据索引值来显示其中某个组件而隐藏其余的组件。
    var _body = IndexedStack(
      children: <Widget>[TabPage1(), TabPage2(), TabPage3()],
      index: _tabIndex,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(titleLists[_tabIndex]),
      ),
      body: _body,
      // bottomNavigationBar属性为页面底部添加导航的Tab
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: getBottomNavItems(),
        currentIndex: _tabIndex,
        onTap: (index) {
          // 底部TabItem的点击事件处理，点击时改变当前选择的Tab的索引值，则页面会自动刷新
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> lists = new List();
    for (int i = 0; i < 3; i++) {
      lists.add(new BottomNavigationBarItem(
          icon: imageLists[i], title: new Text(titleLists[i])));
    }
    print(lists);
    return lists;
  }
}
