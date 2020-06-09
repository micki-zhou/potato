import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatelessWidget {
  String accountText = "";
  String passwordText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  accountText = value;
                },
                decoration: InputDecoration(
                  labelText: 'please enter account',
                  hintText: "",
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                onChanged: (value) {
                  passwordText = value;
                },
                decoration: InputDecoration(
                    labelText: 'please enter password', hintText: ""),
                obscureText: true,
                keyboardType: TextInputType.text,
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

  void _login(BuildContext context) {
    // print(
    //   'account:${accountControlller.text} password: ${passwordController.text}',
    // );
    // if (accountControlller.text.length == 0) {
    //   Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text('please enter account'),
    //   ));
    // }
  }
}
