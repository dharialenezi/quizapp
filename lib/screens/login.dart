import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/services.dart';
import '../shared/shared.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();

    auth.getUser.then((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed('/topics');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.kitchen),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlutterLogo(
                size: 150,
              ),
              Text(
                'بسم الله الرحمن الرحيم',
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center,
              ),
              Text('Login'),
              LoginButton(
                text: 'LOGIN WITH GOOGLE',
                icon: FontAwesomeIcons.google,
                color: Colors.blueAccent,
                loginMethod: auth.googleSignIn(),
              ),
              LoginButton(
                text: 'Continue as Guest',
                loginMethod: auth.anonLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final loginMethod;

  const LoginButton(
      {Key key, this.text, this.icon, this.color, this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, '/topics');
          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}