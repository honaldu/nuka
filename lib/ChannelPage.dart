import 'package:flutter/material.dart';
import 'ChannelContents/Ideal.dart';
import 'ChannelContents/Near.dart';
import 'ChannelContents/Rate.dart';
import 'ShopPage.dart';
import 'SizeConfig.dart';
import 'package:transparent_image/transparent_image.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 10),
            constraints: BoxConstraints(
              maxWidth: 1.0 * SizeConfig.widthMultiplier,
            ),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            0.5 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Today\'s recommends',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 5 * SizeConfig.widthMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            0.5 * SizeConfig.heightMultiplier,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new ShopPage()),
                              );
                            },
                            child: Icon(
                              Icons.shopping_cart,
                              size: 10 * SizeConfig.widthMultiplier,
                              color: Color.fromRGBO(255, 130, 130, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0.5 * SizeConfig.widthMultiplier,
                        0.5 * SizeConfig.heightMultiplier,
                        0.5 * SizeConfig.widthMultiplier,
                        0.5 * SizeConfig.heightMultiplier,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              3 * SizeConfig.widthMultiplier,
                              3 * SizeConfig.heightMultiplier,
                              3 * SizeConfig.widthMultiplier,
                              3 * SizeConfig.heightMultiplier,
                            ),
                            child: CircularProgressIndicator(),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: AssetImage(
                                'Images/juhee1.jpg',
                              ),
                              fit: BoxFit.fill,
                              fadeInDuration: Duration(seconds: 1),
                              fadeOutDuration: Duration(seconds: 1),
                              fadeInCurve: Curves.easeIn,
                              fadeOutCurve: Curves.easeIn,
                              height: 40 * SizeConfig.widthMultiplier,
                              width: 40 * SizeConfig.widthMultiplier,
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0.5 * SizeConfig.widthMultiplier,
                        0.5 * SizeConfig.heightMultiplier,
                        0.5 * SizeConfig.widthMultiplier,
                        0.5 * SizeConfig.heightMultiplier,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              3 * SizeConfig.widthMultiplier,
                              3 * SizeConfig.heightMultiplier,
                              3 * SizeConfig.widthMultiplier,
                              3 * SizeConfig.heightMultiplier,
                            ),
                            child: CircularProgressIndicator(),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: AssetImage(
                                'Images/juhee1.jpg',
                              ),
                              fit: BoxFit.fill,
                              fadeInDuration: Duration(seconds: 1),
                              fadeOutDuration: Duration(seconds: 1),
                              fadeInCurve: Curves.easeIn,
                              fadeOutCurve: Curves.easeIn,
                              height: 40 * SizeConfig.widthMultiplier,
                              width: 40 * SizeConfig.widthMultiplier,
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0.5 * SizeConfig.widthMultiplier,
                        0 * SizeConfig.heightMultiplier,
                        0.5 * SizeConfig.widthMultiplier,
                        0.5 * SizeConfig.heightMultiplier,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: AssetImage(
                                'Images/juhee1.jpg',
                              ),
                              fit: BoxFit.fill,
                              fadeInDuration: Duration(seconds: 1),
                              fadeOutDuration: Duration(seconds: 1),
                              fadeInCurve: Curves.easeIn,
                              fadeOutCurve: Curves.easeIn,
                              height: 40 * SizeConfig.widthMultiplier,
                              width: 40 * SizeConfig.widthMultiplier,
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0.5 * SizeConfig.widthMultiplier,
                        0 * SizeConfig.heightMultiplier,
                        0.5 * SizeConfig.widthMultiplier,
                        0.5 * SizeConfig.heightMultiplier,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              3 * SizeConfig.widthMultiplier,
                              3 * SizeConfig.heightMultiplier,
                              3 * SizeConfig.widthMultiplier,
                              3 * SizeConfig.heightMultiplier,
                            ),
                            child: CircularProgressIndicator(),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: AssetImage(
                                'Images/juhee1.jpg',
                              ),
                              fit: BoxFit.fill,
                              fadeInDuration: Duration(seconds: 1),
                              fadeOutDuration: Duration(seconds: 1),
                              fadeInCurve: Curves.easeIn,
                              fadeOutCurve: Curves.easeIn,
                              height: 40 * SizeConfig.widthMultiplier,
                              width: 40 * SizeConfig.widthMultiplier,
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new Near()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        1 * SizeConfig.widthMultiplier,
                        1 * SizeConfig.heightMultiplier,
                        1 * SizeConfig.widthMultiplier,
                        1 * SizeConfig.heightMultiplier,
                      ),
                      child: Container(
                        width: 95 * SizeConfig.widthMultiplier,
                        height: 10 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                4 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                3 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Icon(
                                Icons.explore,
                                size: 8 * SizeConfig.widthMultiplier,
                                color: Colors.redAccent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                1 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                6 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                '근처 이성 만나기',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 6 * SizeConfig.widthMultiplier),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                18.5 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                3 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Icon(
                                Icons.fiber_new,
                                color: Color.fromRGBO(255, 130, 130, 1),
                                size: 8 * SizeConfig.widthMultiplier,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new Rate()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        1 * SizeConfig.widthMultiplier,
                        1 * SizeConfig.heightMultiplier,
                        1 * SizeConfig.widthMultiplier,
                        1 * SizeConfig.heightMultiplier,
                      ),
                      child: Container(
                        width: 95 * SizeConfig.widthMultiplier,
                        height: 10 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]),
                            borderRadius: BorderRadius.circular(
                                10 * SizeConfig.widthMultiplier),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                4 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                3 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Icon(
                                Icons.thumb_up,
                                size: 8 * SizeConfig.widthMultiplier,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                1 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                6 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                '평가 좋은 이성 만나기',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 6 * SizeConfig.widthMultiplier),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                7 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                3 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Icon(
                                Icons.fiber_new,
                                color: Color.fromRGBO(255, 130, 130, 1),
                                size: 8 * SizeConfig.widthMultiplier,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new Ideal()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        1 * SizeConfig.widthMultiplier,
                        1 * SizeConfig.heightMultiplier,
                        1 * SizeConfig.widthMultiplier,
                        1 * SizeConfig.heightMultiplier,
                      ),
                      child: Container(
                        width: 95 * SizeConfig.widthMultiplier,
                        height: 10 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                4 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                3 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Icon(
                                Icons.loyalty,
                                size: 8 * SizeConfig.widthMultiplier,
                                color: Colors.purpleAccent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                1 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                6 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                '이상형 만나기',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 6 * SizeConfig.widthMultiplier),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                25 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                3 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Icon(
                                Icons.fiber_new,
                                color: Color.fromRGBO(255, 130, 130, 1),
                                size: 8 * SizeConfig.widthMultiplier,
                              ),
                            )
                          ],
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
    );
  }
}
