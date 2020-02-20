import 'package:flutter/material.dart';
import 'SizeMultiplier.dart';

class Chatting extends StatefulWidget {
  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8 * SizeConfig.heightMultiplier),
        child: Center(
          child: AppBar(
            flexibleSpace: SizedBox(height: 8 * SizeConfig.heightMultiplier,),
            actions: <Widget>[
              Icon(
                Icons.report_problem,
                size: 6 * SizeConfig.widthMultiplier ,
              ),
              SizedBox(
                width: 10,
              )
            ],
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              size: 8 * SizeConfig.heightMultiplier,
              color: Color.fromRGBO(236, 128, 130, 1.0),
            ),
            title: Text(
              '뀨뀨 님과의 대화',
              style: TextStyle(
                  fontSize: 3 * SizeConfig.heightMultiplier,
                  color: Color.fromRGBO(236, 128, 130, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 18 * SizeConfig.widthMultiplier,
                    ),
                    Text(
                      '뀨뀨',
                      style: TextStyle(
                          fontSize: 4 * SizeConfig.widthMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: 60 * SizeConfig.widthMultiplier,
                  height: 8 * SizeConfig.heightMultiplier,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: EdgeInsets.fromLTRB(
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color.fromRGBO(255, 130, 130, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '뭐 해?',textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 4 * SizeConfig.widthMultiplier,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: Container(
                width: 60 * SizeConfig.widthMultiplier,
                height: 8 * SizeConfig.heightMultiplier,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: EdgeInsets.fromLTRB(
                  0 * SizeConfig.widthMultiplier,
                  1 * SizeConfig.heightMultiplier,
                  2 * SizeConfig.widthMultiplier,
                  1 * SizeConfig.heightMultiplier,
                ),
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 4 * SizeConfig.widthMultiplier),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '대화를 입력해 주세요',
                      hintStyle:
                      TextStyle(color: Colors.grey[300])),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 10 * SizeConfig.widthMultiplier,
              height: 8 * SizeConfig.heightMultiplier,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              margin: EdgeInsets.fromLTRB(
                0 * SizeConfig.widthMultiplier,
                1 * SizeConfig.heightMultiplier,
                1 * SizeConfig.widthMultiplier,
                1 * SizeConfig.heightMultiplier,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  size: 8 * SizeConfig.widthMultiplier,
                  color: Color.fromRGBO(236, 128, 130, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
