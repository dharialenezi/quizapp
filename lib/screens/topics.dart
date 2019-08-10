import 'package:flutter/material.dart';
import '../shared/shared.dart';

class TopicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
        backgroundColor: Colors.cyan,
      ),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}
