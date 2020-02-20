import 'package:flutter/material.dart';
import 'SignPage.dart';
import 'package:nuka/SizeMultiplier.dart';
import 'package:flutter/animation.dart';
import 'package:nuka/Styling.dart';
//애니메이션 추가 페이지. 애니메이션 추가 요망

class Entrance extends StatefulWidget {
  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.forward();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      ;
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FadeTransition(
          opacity: animation,
          child: new Center(
            child: FlatButton(
              onPressed: () {
               Navigator.of(context).push(CreateRoute());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          20 * SizeConfig.heightMultiplier,
                          0,
                          8 * SizeConfig.heightMultiplier),
                      child: Text('NuKa',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.title),
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                    endIndent: 60,
                    indent: 60,
                    thickness: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          17 * SizeConfig.heightMultiplier,
                          0,
                          20 * SizeConfig.heightMultiplier),
                      child: Icon(
                        Icons.fingerprint,
                        size: 80,
                        color: Color.fromRGBO(238, 146, 130, 1.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Route CreateRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, SecondaryAnimation) => SignPage(),
      transitionsBuilder: (context, animation, SecontaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var Curve = Curves.easeIn;
        var tween = Tween(begin: begin,end: end).chain(CurveTween(curve: Curve));
        return SlideTransition(position: animation.drive(tween),
        child: child,);
      });
}
