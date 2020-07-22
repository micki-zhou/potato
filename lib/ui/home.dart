import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[Container(height: 180, child: _homeBanner())],
        ),
      ),
    );
  }

  PageController pageController = PageController();

  Widget _homeBanner() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        Image.asset('images/img_banner01.png'),
        Image.asset('images/img_banner02.png'),
        Image.asset('images/img_banner03.png')
      ],
    );
  }
}
