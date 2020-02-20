import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/material.dart';

class ProFileInfo extends StatefulWidget {
  @override
  _ProFileInfoState createState() => _ProFileInfoState();
}

class _ProFileInfoState extends State<ProFileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Carousel(
                      images: [
                        Image.asset('Images/Sana0.jpg'),
                        Image.asset('Images/Sana1.jpg'),
                      ],
                      showIndicator: true,
                      borderRadius: true,
                      moveIndicatorFromBottom: 180.0,
                      noRadiusForIndicator: true,
                      overlayShadow: true,
                      overlayShadowColors: Colors.white,
                      overlayShadowSize: 0.7,
                    ),
                  ),
                ),
                Text('사나, 23'),
                Text('Seoul-si, 30km'),
                Text('163cm, B'),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.call),
                      Text('Phone number verified'),
                    ],
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey[400],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Education',
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'University',
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Occupation',
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Singer',
                    ),
                  ],
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey[400],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Religion',
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Catolic',
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Alcohol',
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Ocassionally',
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Smoking',
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Never',
                    ),
                  ],
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey[400],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Personality',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Text(
                            'Kind',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Text(
                            'Cute',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hobby',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Text(
                            'Game',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Text(
                            'Sleeping',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ideal Friend Type',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Text(
                            'Kind Hearted',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Text(
                            'Sweetest pie',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: FlatButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromRGBO(255, 130, 130, 1),
              ),
              padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: Text(
                'Add Friend',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
