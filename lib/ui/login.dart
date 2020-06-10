import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginView> {
  String accountText = "";
  String passwordText = "";

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
              _loginBtn()
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
    );
  }

  // 密码输入框
  Widget _passwordTextField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextField(
        onChanged: (value) {
          passwordText = value;
        },
        decoration: InputDecoration(
            // labelText: 'please enter password',
            hintText: "please enter password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock)),
        obscureText: true,
        keyboardType: TextInputType.text,
      ),
    );
  }

  // 登录按钮
  Widget _loginBtn() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: RaisedButton(
        child: Text('sign in'),
        color: Colors.blueAccent,
        textColor: Colors.white,
        onPressed: () {
          print('account: $accountText  password: $passwordText');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
