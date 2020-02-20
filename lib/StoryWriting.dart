import 'package:flutter/material.dart';
import 'SizeMultiplier.dart';

class StoryWriting extends StatefulWidget {
  @override
  _StoryWritingState createState() => _StoryWritingState();
}

class _StoryWritingState extends State<StoryWriting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          'Write Story',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[Padding(
          padding: EdgeInsets.fromLTRB(
            2 * SizeConfig.widthMultiplier,
            2 * SizeConfig.heightMultiplier,
            3 * SizeConfig.widthMultiplier,
            1 * SizeConfig.heightMultiplier,
          ),
          child: InkWell(
            child: Text('Upload',style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        )],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(fontSize: 6 * SizeConfig.widthMultiplier),
                decoration: InputDecoration.collapsed(hintText: '스토리로 자신을 표현하세요'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FlatButton(
          onPressed: () {},
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.photo_filter,
                  color: Color.fromRGBO(236, 128, 130, 1),
                  size: 10 * SizeConfig.widthMultiplier,
                ),
                SizedBox(
                  width: 8 * SizeConfig.widthMultiplier,
                ),
                Text(
                  'Add Photos',
                  style: TextStyle(
                      color: Color.fromRGBO(236, 128, 130, 1), fontSize: 8 * SizeConfig.widthMultiplier),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
