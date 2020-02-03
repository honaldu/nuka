import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'ConfirmingPage.dart';

class ProfileSetting extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color.fromRGBO(236, 128, 130, 1.0)),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CarouselSlider(
                  height: 400.0,
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Text(
                              'text $i',
                              style: TextStyle(fontSize: 16.0),
                            ));
                      },
                    );
                  }).toList(),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '닉네임'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '생년월일'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '키'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '체형'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '학교'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '직업'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '성격'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '취미'),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(3.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '자기소개'),
                  ),
                ),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new Confirming()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromRGBO(255, 130, 130, 1),
                      ),
                      child: Text(
                        '작성완료',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
