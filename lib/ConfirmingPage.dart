import 'dart:ui';

import 'package:flutter/material.dart';
import 'BottomBar/BottomBarMain.dart';
import 'SizeMultiplier.dart';

class Confirming extends StatefulWidget {
  @override
  _ConfirmingState createState() => _ConfirmingState();
}

class _ConfirmingState extends State<Confirming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new MainPage()),
          );
        },
        child: Container(
          width: double.maxFinite,
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('Images/juhee0.jpg'),
                  fit: BoxFit.cover)),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: Center(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '프로필 작성 완료',
                            style: TextStyle(
                                fontSize: 10 * SizeConfig.widthMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.heightMultiplier,
                        ),
                        Container(
                          width: 10 * SizeConfig.heightMultiplier,
                          height: 10 * SizeConfig.heightMultiplier,
                          child: CircularProgressIndicator(
                            value: null,
                            strokeWidth: 3.0 * SizeConfig.widthMultiplier,
                          ),
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.heightMultiplier,
                        ),
                        Container(
                          child: Text(
                            '프로필 승인이 필요합니다.',
                            style: TextStyle(
                                fontSize: 8 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        SizedBox(
                          height: 8 * SizeConfig.heightMultiplier,
                        ),
                        Text(
                          '요청은 24시간 내에 처리될 예정이니 잠시만 기다려 주시길 바랍니다',
                          style: TextStyle(
                              fontSize: 6 * SizeConfig.widthMultiplier),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
