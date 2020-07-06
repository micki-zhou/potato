import 'package:flutter/material.dart';
import 'package:potato/ui/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> with SingleTickerProviderStateMixin {
  String accountText = "";
  String passwordText = "";
  AnimationController animationController;
  CurvedAnimation curvedAnimation;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutBack);
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
        title: Text('Sign in'),
        backgroundColor: Color(0xff383838),
      ),
      backgroundColor: Color(0xff383838),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _accountTextField(),
              _passwordTextField(),
              _loginBtn(),
              _registerBtn()
            ],
          ),
        ),
      ),
    );
  }

  // 账号输入框
  Widget _accountTextField() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: ScaleTransition(
          alignment: Alignment.centerLeft,
          scale: curvedAnimation,
          child: TextField(
            onChanged: (value) {
              accountText = value;
            },
            decoration: InputDecoration(
              // labelText: 'please enter account',
              hintText: "Please enter account",
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

  // 密码输入框
  Widget _passwordTextField() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ScaleTransition(
          alignment: Alignment.centerRight,
          scale: curvedAnimation,
          child: TextField(
            onChanged: (value) {
              passwordText = value;
            },
            decoration: InputDecoration(
                // labelText: 'please enter password',
                hintText: "Please enter password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
        ));
  }

  // 注册按钮
  Widget _registerBtn() {
    return Container(
      width: 500,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text('Sign up'),
            textColor: Colors.white,
            onPressed: () {
              // 跳转注册界面
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegisterPage();
              }));
            },
          )
        ],
      ),
    );
  }

  // 登录按钮
  Widget _loginBtn() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Builder(builder: (BuildContext context) {
          return RaisedButton(
            child: Text('Sign in'),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              void showsnackBar(String msg) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.blueAccent,
                  duration: Duration(milliseconds: 1500),
                  content: Text(msg),
                ));
              }

              if (accountText.isEmpty) {
                showsnackBar("Account cannot be empty");
                return;
              }
              if (passwordText.isEmpty) {
                showsnackBar("Password cannot be empty");
                return;
              }
              if (accountText.isNotEmpty && passwordText.isNotEmpty) {
                showsnackBar("Success");
              } else {
                showsnackBar("Wrong account or password");
              }
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          );
        }));
  }
}
