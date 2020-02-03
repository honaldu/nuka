import 'package:flutter/material.dart';

class LikeMe extends StatefulWidget {
  @override
  _LikeMeState createState() => _LikeMeState();
}

class _LikeMeState extends State<LikeMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          '나를 좋아하는 사람들',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              100,
              (index) {
                return Center(
                  child: Image.asset('Images/juhee$index.jpg'),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
