import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.kitchen),
      ),
      body: Center(
        child: FlatButton(
          child: Icon(Icons.star),
          onPressed: () {
            Navigator.of(context).pushNamed('/profile');
          },
        ),
      ),
    );
  }
}
