import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'StoryWriting.dart';
import 'StoryDetail.dart';
import 'AlarmPage.dart';
import 'package:http/http.dart' as http;

class StoryPage extends StatefulWidget {
  const StoryPage({Key key}) : super(key: key);
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {


  Future GetStoryList() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}api/story/${prefs.getInt('id')}/'),
        headers: Header);
    var utf8convert= utf8.decode(response.bodyBytes);//한글화

    List data = json.decode(utf8convert);

    return data;
  }


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
                      Icons.notifications,
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
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.add,
                                size: 30,
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
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 30),
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromRGBO(255, 130, 130, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.create,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '나만의 스토리를 올려보세요',
                            style: TextStyle(color: Colors.white,fontSize: 10),
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
              FutureBuilder(
                future: GetStoryList(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Container();
                  }
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(snapshot.data.length, (index) {
                      if(!snapshot.hasData){
                        return Container();
                      }
                      var ds = snapshot.data[index];
                      return FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new StoryDetail(storyid: ds['id'],)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                          width: 150,
                          height: 200,
                          child: (ds['image'] != null)?ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              ds['image'],
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                          ):Text(
                            ds['content']
                          ),
                        ),
                      );
                    }),
                  );
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
