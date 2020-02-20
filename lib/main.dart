import 'package:flutter/material.dart';
import 'openingAnimation.dart';
import 'SizeMultiplier.dart';
import 'package:nuka/Styling.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              home: Entrance(),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
            );
          },
        );
      },
    );
  }
}
