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

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      index++;
      if (index > 2) {
        index = 0;
      }
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
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
          children: <Widget>[Container(height: 180, child: _homeBanner())],
        ),
      ),
    );
  }

  Widget _homeBanner() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('images/img_banner01.png'),
                  fit: BoxFit.cover)),
          margin: EdgeInsets.all(10),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('images/img_banner02.png'),
                  fit: BoxFit.cover)),
          margin: EdgeInsets.all(10),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('images/img_banner03.png'),
                  fit: BoxFit.cover)),
          margin: EdgeInsets.all(10),
        )
      ],
    );
    // pageController.addListener(() {
    //   if(pageController)
    // });
  }
}
