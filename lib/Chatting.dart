import 'package:flutter/material.dart';

class Chatting extends StatefulWidget {
  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            Icons.report_problem,
            size: 40,
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          '뀨뀨 님과의 대화',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: '텍스트를 입력해주세요',
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
