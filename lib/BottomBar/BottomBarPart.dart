import 'package:flutter/material.dart';
import '../HomePage.dart';
import '../ChatPage.dart';
import '../ChannelPage.dart';
import '../ProfilePage.dart';
import '../StoryPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomBarPart extends StatefulWidget {
  @override
  _BottomBarPartState createState() => _BottomBarPartState();
}

class _BottomBarPartState extends State<BottomBarPart> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _curvedNavigationBar(_selectedIndex),
      body: PageStorage(bucket: bucket, child: pages[_selectedIndex]),
    );
  }
}
