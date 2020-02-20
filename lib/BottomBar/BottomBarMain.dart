import 'package:flutter/material.dart';
import 'BottomBarPart.dart';
import 'package:nuka/Styling.dart';
import 'package:nuka/SizeMultiplier.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              home: BottomBarPart(),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
            );
          },
        );
      },
    );
  }
}
