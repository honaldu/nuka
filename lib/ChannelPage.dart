import 'package:flutter/material.dart';
import 'ChannelContents/Ideal.dart';
import 'ChannelContents/Near.dart';
import 'ChannelContents/Rate.dart';
import 'ShopPage.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({Key key}) : super(key: key);
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '추천',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new ShopPage()),
                              );
                            },
                            child: Icon(
                              Icons.shopping_cart,
                              size: 40,
                              color: Color.fromRGBO(236, 128, 130, 1.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
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
                            width: 150,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'Images/juhee0.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
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
                            width: 150,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'Images/juhee2.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Near()),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 80,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey[300]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                              child: Text(
                                '근처 사는 이성 만나기',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Rate()),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 80,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey[300]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                              child: Text(
                                '평가 좋은 이성 만나기',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Ideal()),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 80,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey[300]),
                                color: Colors.purpleAccent,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                              child: Text(
                                '이상형 만나기',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
