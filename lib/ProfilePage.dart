import 'package:flutter/material.dart';
import 'SettingPage.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SetiingPage()),
                        );
                      },
                      child: Icon(
                        Icons.settings,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '닉네임',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 130, 130, 1),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            width: 200,
                            height: 30,

                            child: Center(
                                child: Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 300,
                          height: 50,

                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Center(
                            child: Text(
                              'Check My Content',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 300,
                          height: 50,

                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                'Store',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 130, 130, 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Center(
                            child: Text(
                              'Help Center',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),

                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Center(
                            child: Text(
                              'FeedBack',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromRGBO(255, 130, 130, 1),
                          ),

                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Center(
                            child: Text(
                              'Notice',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 130, 130, 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),

                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Center(
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
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
