import 'package:flutter/material.dart';
import '../services/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {

    var user = Provider.of<FirebaseUser>(context);

    return Scaffold(
      appBar: AppBar(
        // title: Text(user.email),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: FlatButton(
          child: Text('Logout'),
          color: Colors.redAccent,
          onPressed: () async {
            await auth.signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
        ), 
      ),
    );
  }
}
