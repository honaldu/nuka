import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'PeopleWhoLikeMe.dart';
import 'SizeConfig.dart';
import 'Chatting.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  int Myid;

  Future GetUserList() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}auth/chattinglist/${prefs.getInt('id')}'),
        headers: Header);
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }

  Future GetMessage(int myid, int peerid) async{
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}chat/api/messages/${myid}/${peerid}'),
        headers: {"Accept": "application/json"});
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }

  GetMyId() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    setState(() {
      Myid = prefs.getInt('id');
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    GetMyId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new LikeMe()),
                    );
                  },
                  child: Container(
                    width: 90 * SizeConfig.widthMultiplier,
                    height: 8 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(
                      2 * SizeConfig.widthMultiplier,
                      1 * SizeConfig.heightMultiplier,
                      2 * SizeConfig.widthMultiplier,
                      1 * SizeConfig.heightMultiplier,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromRGBO(255, 130, 130, 1),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(3.0, 3.0))
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '나를 좋아하는 사람들',
                          style: TextStyle(color: Colors.white,fontSize: 5 * SizeConfig.widthMultiplier),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                          size: 6 * SizeConfig.widthMultiplier,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10 * SizeConfig.heightMultiplier,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ChatList(context),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ChatList(BuildContext context){
    return FutureBuilder(
        future: GetUserList(),
        builder: (context, snapshot) {
          if(!snapshot.hasData || snapshot.data.isEmpty){
            //나중에 디자인
            return Text('현재 채팅 중인 유저가 없습니다', style: TextStyle(
                fontSize: 10 * SizeConfig.widthMultiplier,
                color: Color.fromRGBO(255, 130, 130, 1),fontWeight: FontWeight.bold
            ),textAlign: TextAlign.center,);
          }
          return ListView.builder(
              itemCount:snapshot.data[0]['chttingwith'].length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                if(snapshot.data[0]['chttingwith'].length == 0){
                  //나중에 디자인하기
                  return Text('현재 채팅 중인 유저가 없습니다', style: TextStyle(
                      fontSize: 50,
                      color: Colors.red
                  ),);
                }else{
                  return ChttingUserList(snapshot.data[0]['chttingwith'][index]);
                }

              });
        }
    );
  }

  Widget ChttingUserList(var ds){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            (ds['image'] != null)?ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                ds['image'],
                width: 40 * SizeConfig.widthMultiplier,
                height: 40 * SizeConfig.heightMultiplier,
                fit: BoxFit.fill,
              ),
            ):Icon(
              //추후 프로필 없는사람 대체 이미지 만들기
              Icons.person,
              size: 18 * SizeConfig.widthMultiplier,
            ),
            Text(
              (ds['nickname'] != null)?ds['nickname']:'알 수 없음',
              style: TextStyle(
                  fontSize: 8 * SizeConfig.widthMultiplier, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            SharedPreferences prefs =await SharedPreferences.getInstance();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new Chatting(
                    channel: IOWebSocketChannel.connect((prefs.getInt('id') >= ds['id'])?'ws://15.164.212.90:8000/ws/chatting/${prefs.getInt('id')}-${ds['id']}/':'ws://15.164.212.90:8000/ws/chatting/${ds['id']}-${prefs.getInt('id')}/'),
                    myid: prefs.getInt('id'),
                    mynickname: prefs.getString('nickname'),
                    peerId: ds['id'],
                    peernickname: ds['nickname'],
                  )),
            );
          },
          child: FutureBuilder(
              future: GetMessage(Myid, ds['id']),
              builder: (context, snapshot) {
                if(!snapshot.hasData || snapshot.data.isEmpty){
                  return Container();
                }
                return Container(
                  width: 60 * SizeConfig.widthMultiplier,
                  height: 8 * SizeConfig.heightMultiplier,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: EdgeInsets.fromLTRB(
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color.fromRGBO(255, 130, 130, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Center(
                    child: Text(
                      (snapshot.data[0] != null)?snapshot.data[0]['message']:'',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 4 * SizeConfig.widthMultiplier,
                          color: Colors.white),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}