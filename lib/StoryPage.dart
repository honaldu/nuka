import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'StoryWriting.dart';
import 'StoryDetail.dart';
import 'SizeConfig.dart';
import 'AlarmPage.dart';
import 'package:http/http.dart' as http;

class StoryPage extends StatefulWidget {
  const StoryPage({Key key}) : super(key: key);
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Future GetStoryList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}api/story/${prefs.getInt('id')}/'),
        headers: Header);
    var utf8convert = utf8.decode(response.bodyBytes); //한글화

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
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: InkWell(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new AlarmPage(
                                    myid: prefs.getInt('id'),
                                  )),
                        );
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 50,
                      ),
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
              FutureBuilder(
                  future: GetStoryList(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: List.generate(snapshot.data.length, (index) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        var ds = snapshot.data[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new StoryDetail(
                                        storyid: ds['id'],
                                      )),
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
                              child: (ds['image'] != null)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        ds['image'],
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Text(ds['content']),
                            ),
                          ),
                        );
                      }),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
