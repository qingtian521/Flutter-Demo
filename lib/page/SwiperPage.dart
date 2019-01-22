import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  createState() => SwiperPageState();
}

class SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("轮播图"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Expanded(
//          width: MediaQuery.of(context).size.width,
//          height: 200.0,
//          padding: EdgeInsets.all(10.0),
          flex: 1,
          child: swiper1(),
        ),
        Expanded(
//          width: MediaQuery.of(context).size.width,
//          height: 200.0,
//          padding: EdgeInsets.all(10.0),\
          flex: 1,
          child: swiper2(),
        ),
        Expanded(
//          width: MediaQuery.of(context).size.width,
//          height: 200.0,
//          padding: EdgeInsets.all(10.0),
          flex: 1,
          child: swiper3(),
        )
      ],
    );
  }

  swiper1() {
    return Swiper(
      itemCount: 3,
      itemBuilder: _swiperBuilder,
      controller: SwiperController(),
      scrollDirection: Axis.horizontal,
      autoplay: true,
      pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
        color: Colors.black54,
        activeColor: Colors.white,
      )),
      onTap: (index) {},
    );
  }

  swiper2() {
    return Swiper(
      autoplay: true,
      itemBuilder: _swiperBuilder,
      itemCount: 3,
      viewportFraction: 0.8,
      pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
        color: Colors.black54,
        activeColor: Colors.white,
      )),
      scale: 0.9,
    );
  }

  swiper3() {
    return Swiper(
        layout: SwiperLayout.CUSTOM,
        autoplay: true,
        duration: 1000,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Colors.black54,
          activeColor: Colors.white,
        )),
        customLayoutOption:
            new CustomLayoutOption(startIndex: -1, stateCount: 3)
                .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
          new Offset(-300.0, -40.0),
          new Offset(0.0, 0.0),
          new Offset(300.0, -40.0)
        ]),
        itemWidth: 260.0,
        itemHeight: 200.0,
        itemBuilder: _swiperBuilder,
        itemCount: 3);
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Image.network(
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548062569565&di=e659e29a49d43a81bd72e5756a8ce9c0&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F54ebececeda0217648263cc944d6cfd413a17cdf2cc6-MGHS0y_fw658",
      fit: BoxFit.fill,
    );
  }
}
