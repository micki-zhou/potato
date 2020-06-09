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
              Padding(
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
              ),
              Padding(
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
              ),
              LoginButton()
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: RaisedButton(
        child: Text('sign in'),
        color: Colors.blueAccent,
        textColor: Colors.white,
        onPressed: () {
          _login(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  void _login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
  }
}
