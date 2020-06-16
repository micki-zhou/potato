import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  String accountText = "";
  AnimationController animationController;
  CurvedAnimation curvedAnimation;
  Animation<Offset> animation;
  Animation<double> slide;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutBack);
    animation =
        Tween(begin: Offset(0, 0), end: Offset(0, -3)).animate(curvedAnimation);
    slide = Tween(begin: 200.0, end: 50.0).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        backgroundColor: Color(0xff383838),
      ),
      backgroundColor: Color(0xff383838),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, slide.value, 30, 0),
        child: Column(
          children: <Widget>[_textTip(), _accountTextField(), _next()],
        ),
      ),
    );
  }

  Widget _textTip() {
    return Container(
      width: 500,
      child: Text(
        'Hi , \nwhat name do you want ?',
        style: TextStyle(color: Colors.white, fontSize: 25),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _accountTextField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: TextField(
        onChanged: (value) {
          accountText = value;
        },
        decoration: InputDecoration(
          hintText: "Please enter account",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          filled: true,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  @Deprecated('disable')
  Widget _textTip2() {
    return Container(
        width: 500,
        child: SlideTransition(
          position: animation,
          child: Text(
            'Hi , \nwhat name do you want ?',
            style: TextStyle(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.start,
          ),
        ));
  }

  @Deprecated('disable')
  Widget _accountTextField2() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: SlideTransition(
          position: animation,
          child: TextField(
            onChanged: (value) {
              accountText = value;
            },
            decoration: InputDecoration(
              hintText: "Please enter account",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              fillColor: Colors.white,
              filled: true,
            ),
            keyboardType: TextInputType.number,
          ),
        ));
  }

  Widget _next() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Builder(builder: (BuildContext context) {
          return FlatButton(
              onPressed: () {
                if (accountText.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterNext();
                  }));
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.blueAccent,
                    duration: Duration(milliseconds: 1500),
                    content: Text('Account cannot be empty'),
                  ));
                }
              },
              color: Colors.blueAccent,
              shape: CircleBorder(),
              child: Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 50,
              ));
        })
      ],
    );
  }

  void saveAccountValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("account", accountText);
  }
}

class RegisterNext extends StatefulWidget {
  @override
  _RegisterNextState createState() => _RegisterNextState();
}

class _RegisterNextState extends State<RegisterNext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up3'),
        backgroundColor: Color(0xff383838),
      ),
      backgroundColor: Color(0xff383838),
    );
  }
}
