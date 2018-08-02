import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (String email) {
                  setState(() {
                    _emailValue = email;
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (String password) {
                  setState(() {
                    _passwordValue = password;
                  });
                },
              ),
              SwitchListTile(
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
                title: Text('Accept Terms'),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  }),
            ],
          ),
        ));
  }
}
