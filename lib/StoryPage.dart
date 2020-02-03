import 'package:flutter/material.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:web_socket_channel/io.dart';
import 'StoryWriting.dart';
import 'StoryDetail.dart';
import 'AlarmPage.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key key}) : super(key: key);
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 3;

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
                        MaterialPageRoute(builder: (context) => new AlarmPage(
                          channel: IOWebSocketChannel.connect(AlarmSocketUrl + '10/'),
                        )),
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
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new StoryWriting()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.add,
                                size: 60,
                              ),
                            ),
                            Text(
                              'No Recent Story.',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromRGBO(255, 130, 130, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.create,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '나만의 스토리를 올려보세요',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: (itemWidth / itemHeight),
                children: List.generate(100, (index) {
                  return Container(
                    margin: EdgeInsets.all(1.0),
                    child: Center(
                      child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new StoryDetail()),
                            );
                          },
                          child: Image.asset('Images/juhee$index.jpg')),
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
