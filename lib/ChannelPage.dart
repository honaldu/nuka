import 'package:flutter/material.dart';
import 'ChannelContents/Ideal.dart';
import 'ChannelContents/Near.dart';
import 'ChannelContents/Rate.dart';

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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '추천',
                            style: TextStyle(fontSize: 30,color: Colors.red),

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            size: 40,
                            color: Colors.red,
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
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Near()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey[300]),
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.orange],
                                    begin: Alignment.centerRight,
                                    end: Alignment(-1.0, -1.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Text(
                              '근처 사는 이성 만나기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Rate()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey[300]),
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.blue],
                                    begin: Alignment.centerRight,
                                    end: Alignment(-1.0, -1.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Text(
                              '평가 좋은 이성 만나기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Ideal()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey[300]),
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.purple],
                                    begin: Alignment.centerRight,
                                    end: Alignment(-1.0, -1.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            padding: EdgeInsets.fromLTRB(105, 20, 105, 20),
                            child: Text(
                              '이상형 만나기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
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
