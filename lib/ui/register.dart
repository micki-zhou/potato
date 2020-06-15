import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  String accountText = "";
  String passwordText = "";
  AnimationController animationController;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutBack);
    animationController.forward();
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
        padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Column(
          children: <Widget>[_textTip(), _accountTextField()],
        ),
      ),
    );
  }

  Widget _textTip() {
    return Container(
      width: 500,
      child: Text(
        'What name do you want ?',
        style: TextStyle(color: Colors.white, fontSize: 25),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _accountTextField() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: ScaleTransition(
          alignment: Alignment.centerLeft,
          scale: curvedAnimation,
          child: TextField(
            onChanged: (value) {
              accountText = value;
            },
            decoration: InputDecoration(
              // labelText: 'please enter account',
              hintText: "please enter account",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.number,
          ),
        ));
  }
}
