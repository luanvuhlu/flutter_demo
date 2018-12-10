import 'package:flutter/material.dart';

import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _userNameValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Username'),
            onChanged: (value) {
              setState(() {
                _userNameValue = value;
              });
            },
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
            onChanged: (value) {
              setState(() {
                _passwordValue = value;
              });
            },
          ),
          SwitchListTile(
            value: _acceptTerms,
            title: Text('Accept terms'),
            onChanged: (bool value) {
              setState(() {
                _acceptTerms = value;
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('LOGIN'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
