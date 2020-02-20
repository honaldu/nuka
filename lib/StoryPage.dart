import 'package:flutter/material.dart';
import 'StoryWriting.dart';
import 'StoryDetail.dart';
import 'AlarmPage.dart';
import 'SizeMultiplier.dart';
import 'package:nuka/Styling.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key key}) : super(key: key);
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new AlarmPage()),
                      );
                    },
                    child: Icon(
                      Icons.alarm,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new StoryWriting()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0 * SizeConfig.widthMultiplier,
                        0 * SizeConfig.heightMultiplier,
                        0 * SizeConfig.widthMultiplier,
                        0 * SizeConfig.heightMultiplier,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          2 * SizeConfig.widthMultiplier,
                          2 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          2 * SizeConfig.heightMultiplier,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                                offset: Offset(3.0, 3.0)),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.add,
                                size: 10 * SizeConfig.widthMultiplier,
                              ),
                            ),
                            Text(
                              'No Recent Story.',
                              style: TextStyle(
                                  fontSize: 3 * SizeConfig.widthMultiplier),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4 * SizeConfig.widthMultiplier,
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
                                offset: Offset(3.0, 3.0)),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.create,
                              color: Colors.white,
                              size: 6 * SizeConfig.widthMultiplier,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '나만의 스토리를 올려보세요',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.widthMultiplier,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5 * SizeConfig.heightMultiplier,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(100, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new StoryDetail()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1 * SizeConfig.heightMultiplier),
                      child: Container(
                        width: 10 * SizeConfig.widthMultiplier,
                        height: 30 * SizeConfig.heightMultiplier,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'Images/juhee$index.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
