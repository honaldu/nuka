import 'package:flutter/material.dart';
import 'SettingPage.dart';
import 'SizeMultiplier.dart';
import 'package:nuka/Styling.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SetiingPage()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          0 * SizeConfig.widthMultiplier,
                          0 * SizeConfig.heightMultiplier,
                          5 * SizeConfig.widthMultiplier,
                          0 * SizeConfig.heightMultiplier,
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 10 * SizeConfig.widthMultiplier,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        0 * SizeConfig.widthMultiplier,
                        0 * SizeConfig.heightMultiplier,
                        0 * SizeConfig.widthMultiplier,
                        1 * SizeConfig.heightMultiplier,
                      ),
                      child: Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Icon(
                            Icons.person,
                            size: 20 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4 * SizeConfig.widthMultiplier,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '닉네임',
                          style: TextStyle(
                              fontSize: 5 * SizeConfig.widthMultiplier,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Container(
                            width: 50 * SizeConfig.widthMultiplier,
                            height: 5 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                                child: Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Container(
                            width: 90 * SizeConfig.widthMultiplier,
                            height: 8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                                child: Text(
                              'Check My Profile',
                              style: TextStyle(color: Colors.white, fontSize: 6 * SizeConfig.widthMultiplier),
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Container(
                            width: 90 * SizeConfig.widthMultiplier,
                            height: 8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    2 * SizeConfig.widthMultiplier,
                                    1 * SizeConfig.heightMultiplier,
                                    2 * SizeConfig.widthMultiplier,
                                    1 * SizeConfig.heightMultiplier,
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 8 * SizeConfig.widthMultiplier,
                                    color: Colors.white,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Store',
                                    style: TextStyle(color: Colors.white, fontSize: 6 * SizeConfig.widthMultiplier),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Container(
                            width: 90 * SizeConfig.widthMultiplier,
                            height: 8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                                child: Text(
                                  'Help Center',
                                  style: TextStyle(color: Colors.white, fontSize: 6 * SizeConfig.widthMultiplier),
                                )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Container(
                            width: 90 * SizeConfig.widthMultiplier,
                            height: 8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                                child: Text(
                                  'FeedBack',
                                  style: TextStyle(color: Colors.white, fontSize: 6 * SizeConfig.widthMultiplier),
                                )),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Container(
                            width: 90 * SizeConfig.widthMultiplier,
                            height: 8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                                child: Text(
                                  'Notice',
                                  style: TextStyle(color: Colors.white, fontSize: 6 * SizeConfig.widthMultiplier),
                                )),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            0 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Container(
                            width: 90 * SizeConfig.widthMultiplier,
                            height: 8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 130, 130, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(3.0, 3.0))
                                ]),
                            child: Center(
                                child: Text(
                                  'Sign Out',
                                  style: TextStyle(color: Colors.white, fontSize: 6 * SizeConfig.widthMultiplier),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
