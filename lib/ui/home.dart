import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:potato/config/MyColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;
  PageController pageController;
  int index = 0;
  //TODO 临时图片数据
  List<String> imageUrls = [
    'images/img_banner01.png',
    'images/img_banner02.png',
    'images/img_banner03.png'
  ];
  List<String> recomendUrls = [
    'images/icon_home_daily.png',
    'images/icon_home_music_list.png',
    'images/icon_home_rank.png',
    'images/icon_home_radio.png',
    'images/icon_home_live.png',
    'images/icon_home_album.png',
    'images/icon_home_chat.png'
  ];
  List<String> recomendStrs = ['每日推荐', '歌单', '排行榜', '私人FM', '直播', '数字专辑', '唱聊'];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      index++;
      if (index > imageUrls.length - 1) {
        index = 0;
      }
      pageController.animateToPage(index,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Center(
        child: Column(
          children: <Widget>[_topView(), _homeBanner(), _dailyRecommend()],
        ),
      ),
    );
  }

  // 顶部栏
  Widget _topView() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
      color: MyColors.homeTheme,
      height: 70,
      child: Row(
        children: [
          _menuButton(),
          _searchView(),
        ],
      ),
    );
  }

  // 菜单按钮
  Widget _menuButton() {
    return ButtonTheme(
      minWidth: 50,
      height: double.infinity,
      child: FlatButton(
          onPressed: () {
            print("press menu");
          },
          child: Icon(
            Icons.menu,
            // color: MyColors.balck,
          )),
    );
  }

  // 搜索框
  Widget _searchView() {
    return Container();
  }

  // banner
  Widget _homeBanner() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 150,
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
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
        ),
        margin: EdgeInsets.all(10),
      ));
    }
    return banners;
  }

  // 每日推荐列表
  Widget _dailyRecommend() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _getDailyRecommend(),
      ),
    );
  }

  // 处理获取每日推荐列表
  List<Widget> _getDailyRecommend() {
    List<Widget> result = new List();
    for (var i = 0; i < recomendUrls.length; i++) {
      result.add(GestureDetector(
        onTap: () {
          print("recommend click: $i");
        },
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColors.theme,
                    shape: BoxShape.circle,
                  ),
                ),
                Image(
                  image: AssetImage(recomendUrls[i]),
                  height: 25,
                  width: 25,
                ),
              ],
            ),
            Text(recomendStrs[i]),
          ],
        ),
      ));
    }
    return result;
  }
}
