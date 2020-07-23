import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;
  PageController pageController = PageController();
  int index = 0;
  //TODO 临时图片数据
  List<String> imageUrls = [
    'images/img_banner01.png',
    'images/img_banner02.png',
    'images/img_banner03.png'
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      index++;
      if (index > imageUrls.length - 1) {
        index = 0;
      }
      pageController.animateToPage(index,
          duration: Duration(seconds: 1), curve: Curves.easeInOutBack);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[_homeBanner(), _dailyRecommend()],
        ),
      ),
    );
  }

  // banner
  Widget _homeBanner() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      height: 180,
      child: PageView(
        controller: pageController,
        children: _getBannerImageWidget(),
      ),
    );
  }

  // 处理图片列表
  List<Widget> _getBannerImageWidget() {
    List<Widget> banners = new List();
    for (String url in imageUrls) {
      banners.add(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
        margin: EdgeInsets.all(10),
      ));
    }
    return banners;
  }

  // 每日推荐列表
  Widget _dailyRecommend() {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[],
      ),
    );
  }

  // Widget _getDailyRecommend() {
  //   return ;
  // }
}
