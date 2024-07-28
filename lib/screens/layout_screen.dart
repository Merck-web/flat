import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My first App'),
      ),
      body: Center(
        child: Image(image: AssetImage('assets/123.jpg')),
      ),
    );
  }
}
