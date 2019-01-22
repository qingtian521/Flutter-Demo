import 'package:flutter/material.dart';
import 'package:video_app_flutter/Utils.dart';

class GridListPage extends StatefulWidget {
  createState() => GridListPageState();
}

class GridListPageState extends State<GridListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridList"),
      ),
      body: _body(),
    );
  }

  _body() {
    List<Data> datas = List();
    for (int i = 0; i < 10; i++) {
      datas.add(Data("小明", 12,
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548137711686&di=927c798e390e559b8126e953f912f8c9&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fzhidao%2Fwh%253D450%252C600%2Fsign%3D1be47219c1fdfc03e52debbce10faba2%2Fb8389b504fc2d562562d540ae51190ef76c66c34.jpg"));
    }
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10.0),
      children: datas.map((Data data) {
        return _getGridViewItem(context, data);
      }).toList(),
    );
  }

  Widget _getGridViewItem(BuildContext context, Data data) {
    return InkWell(
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.network(
                data.head,
                fit: BoxFit.fill,
              ),
              flex: 3,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data.name,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data.age.toString(),
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Utils.getDialog(data.name, context);
            });
      },
    );
  }
}

class Data {
  String name;
  int age;
  String head;
  Data(this.name, this.age, this.head);
}
