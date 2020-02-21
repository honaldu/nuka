import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage.dart';
import '../ChatPage.dart';
import '../ChannelPage.dart';
import '../ProfilePage.dart';
import '../StoryPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;

class BottomBarPart extends StatefulWidget {
  @override
  _BottomBarPartState createState() => _BottomBarPartState();
}

class _BottomBarPartState extends State<BottomBarPart> {

  Geolocator geolocator = Geolocator();
  String fcmToken;

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  AddLocation() async {
    _getLocation().then((position) {
      AddPositions(position.longitude, position.latitude);
    });
  }

  AddPositions(double longitude, double latitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('longitude', longitude);
    prefs.setDouble('latitude', latitude);

    Map<String, dynamic> Data = {};


    Data = {
      "location": "POINT (${longitude} ${latitude})",
      "longitude": longitude,
      "latitude": latitude};



    String addr = '${ServerIp}auth/user/${prefs.getInt('id')}/';

    var response = await http.patch(addr, headers: Header,body: json.encode(Data));



    // 200 ok. 정상 동작임을 알려준다.

    if(response.statusCode == 200){
      var utf8convert= utf8.decode(response.bodyBytes);//한글화
      Map data = json.decode(utf8convert);
    }else{
      print(response.statusCode);
      print(utf8.decode(response.bodyBytes));
      //나중에 로그인 실패 메세지 토스트로 만들기
      return null;
    }
  }

  AddFCMToken(String fcmtoken) async {
    if(fcmtoken != null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> Data = {};


      Data = {
        "fcmtoken" : fcmtoken
      };



      String addr = '${ServerIp}auth/user/${prefs.getInt('id')}/';

      var response = await http.patch(addr, headers: Header,body: json.encode(Data));



      // 200 ok. 정상 동작임을 알려준다.

      if(response.statusCode == 200){
        var utf8convert= utf8.decode(response.bodyBytes);//한글화
        Map data = json.decode(utf8convert);
      }else{
        print(response.statusCode);
        print(utf8.decode(response.bodyBytes));
        //나중에 로그인 실패 메세지 토스트로 만들기
        return null;
      }
    }
  }


  final List<Widget> pages = [
    ChannelPage(
      key: PageStorageKey('Channel Page'),
    ),
    StoryPage(
      key: PageStorageKey('Story Page'),
    ),
    MainPage(
      key: PageStorageKey('Main Page'),
    ),
    ChatPage(
      key: PageStorageKey('Chat Page'),
    ),
    ProfilePage(
      key: PageStorageKey('Profile Page'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 2;

  Widget _curvedNavigationBar(int selectedIndex) => CurvedNavigationBar(
          onTap: (int index) => setState(() => _selectedIndex = index),
          index: selectedIndex,
          color: Color.fromRGBO(236, 128, 130, 1.0),
          backgroundColor: Colors.white,
          buttonBackgroundColor: Color.fromRGBO(236, 128, 130, 1.0),
          items: <Widget>[
            Icon(
              Icons.list,
              color: Colors.white,
            ),
            Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.sms,
              color: Colors.white,
            ),
            Icon(
              Icons.perm_identity,
              color: Colors.white,
            ),
          ]);



  final FirebaseMessaging _fcm = FirebaseMessaging();


  /// Get the token, save it to the database for current user
  _saveDeviceToken() async {
    // Get the current user


    // Get the token for this device
    String _fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (_fcmToken != null) {
      AddFCMToken(_fcmToken);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _saveDeviceToken();
    AddLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      bottomNavigationBar: _curvedNavigationBar(_selectedIndex),
      body: PageStorage(bucket: bucket, child: pages[_selectedIndex]),
    );
  }
}
