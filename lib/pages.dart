import 'package:flutter/material.dart';
//import 'package:pageview/main.dart';
//import 'package:swipedetector/swipedetector.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          'First Page',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          'Second Page',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          'Third Page',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
