import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StoryDetail extends StatefulWidget {

  int storyid;
  StoryDetail({Key key, @required this.storyid}):super(key:key);

  @override
  _StoryDetailState createState() => _StoryDetailState(storyid: storyid);
}

class _StoryDetailState extends State<StoryDetail> {
  int storyid;
  _StoryDetailState({Key key, @required this.storyid});




  Future GetStoryDetail() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}api/story/${prefs.getInt('id')}/${storyid}/'),
        headers: {"Accept": "application/json"});
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
      ),
      body: FutureBuilder(
        future: GetStoryDetail(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Container();
          }
          var ds = snapshot.data;
          return ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    (ds['image'] != null)?Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Image.network(ds['image']),
                    ):Container(),
                    TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: (ds['content'] != null)?ds['content']:''),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.thumb_up,
                      size: 80,
                      color: Color.fromRGBO(236, 128, 130, 1.0),
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
