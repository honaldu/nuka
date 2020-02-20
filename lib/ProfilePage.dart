import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SettingPage.dart';
import 'SizeConfig.dart';
import 'package:http/http.dart' as http;

import 'SignPage.dart';
import 'Utils/rest_api_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GetUser() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}auth/user/${prefs.getInt('id')}'),
        headers: Header);
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }

  GoogleSignIn googleSignIn = GoogleSignIn();

  signout() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    googleSignIn.signOut().then((value){
      print('로그아웃완료');
      _pref.clear();
      print('정보 clear');

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SignPage()),
              (Route<dynamic> route) => false);
    });





  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GetUser(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Container();
          }
          var ds = snapshot.data;
          return ListView(
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
                    Container(
                      child: Row(
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
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Icon(
                                Icons.person,
                                size: 20 * SizeConfig.widthMultiplier,
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
                                (ds['nickname'] != null)?ds['nickname']:'',
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1 * SizeConfig.heightMultiplier,
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
                    )
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
