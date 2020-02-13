import 'package:flutter/material.dart';
import 'openingAnimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.blue),
      home: Entrance(),
    );
  }
}
