import 'package:flutter/material.dart';
import 'SizeMultiplier.dart';
import 'package:nuka/Styling.dart';

class StoryDetail extends StatefulWidget {
  @override
  _StoryDetailState createState() => _StoryDetailState();
}

class _StoryDetailState extends State<StoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 1 * SizeConfig.heightMultiplier),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 40 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey[300]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(3.0, 3.0))
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'Images/juhee1.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 1 * SizeConfig.heightMultiplier),
                  child: SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 1 * SizeConfig.heightMultiplier),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 5 * SizeConfig.widthMultiplier),
                    decoration: InputDecoration.collapsed(hintText: '텍스트 출력'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.thumb_up,
                    size: 18 * SizeConfig.widthMultiplier,
                    color: Color.fromRGBO(236, 128, 130, 1.0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
