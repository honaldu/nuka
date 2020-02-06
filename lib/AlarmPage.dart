import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;


class AlarmPage extends StatefulWidget {

  final WebSocketChannel channel;
  int myid;

  AlarmPage({Key key, @required this.channel, @required this.myid}):super(key:key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {


  List AlarmList;

  Future GetMessage()async{
    http.Response response = await http.get(
        Uri.encodeFull('${AlarmUrl}${widget.myid}'),
        headers: {"Accept": "application/json"});
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }

  @override
  void initState() {
    // TODO: implement initState
    AlarmList = List();
    GetMessage().then((data){
      print(data);
      setState(() {
        AlarmList = data;
      });
    });

    //소켓

    widget.channel.stream.listen((data){
      Map<dynamic, dynamic> datamap = json.decode(data);
    });

    super.initState();

  }


  buildAlarmList() {
    return Flexible(
      child:ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: AlarmList.length,
          itemBuilder:(context, index){
            return buildItem(AlarmList[index]);
          }
      ),
    );
  }


  Widget buildItem(var ds){

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width/30),
      child: Container(
        width: MediaQuery.of(context).size.width/1.3,
        height: MediaQuery.of(context).size.height/10,
        decoration: BoxDecoration(
          border: Border.all(width: 1)
        ),
        child: Row(
          children: <Widget>[
//            Container(
//              width: MediaQuery.of(context).size.width/4.8,
//              height: MediaQuery.of(context).size.height/12,
//              decoration: BoxDecoration(
//                  border: Border.all(width: 1)
//              ),
//              child: ClipRRect(
//                borderRadius: BorderRadius.all(
//                    Radius.circular(10)),
//                child: (ds['nickname'][0]['image1'] != null)
//                    ? CachedNetworkImage(
//                  imageUrl: ds['nickname'][0]['image1'],
//                  fit: BoxFit.cover,
//                )
//                    : Icon(
//                  Icons.person
//                ),
//              ),
//            ),
            Column(
              children: <Widget>[
                //좋아요 누른 사람 닉네임 ds['nickname'][0]['nickname']
                //날짜 ds['updated_ay']
                //글 내용 ds['message']
                //글 내용에 '회원님의 [게시물내용]에 (좋아요누른사람) (여러명이면 외2명이)좋아요를 눌렀습니다 라는형식
                //맨 밑은 날짜
                Container(
                  width: MediaQuery.of(context).size.width/1.4,
                  height: MediaQuery.of(context).size.height/15.8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1)
                  ),
                  child: Text(ds['message']),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width/4.8,),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/30,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          '스토리 알림',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          buildAlarmList()
        ],
      )
    );
  }
}
