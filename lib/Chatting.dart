import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class Chatting extends StatefulWidget {
  int peerId, myid;
  String peernickname,mynickname;
  final WebSocketChannel channel;

  Chatting({Key key, @required this.peerId, @required this.peernickname, @required this.myid, @required this.mynickname, @required this.channel}):super(key:key);

  @override
  _ChattingState createState() => _ChattingState(peerId: peerId, peernickname: peernickname,myid: myid, mynickname: mynickname);
}

class _ChattingState extends State<Chatting> {

  int peerId, myid;
  String peernickname, mynickname;
  List messages;
  TextEditingController textEditingController = TextEditingController();

  _ChattingState({Key key, @required this.peerId, @required this.peernickname, @required this.myid, @required this.mynickname});



  Future GetMessage(int myid, int peerid) async{
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}chat/api/messages/${myid}/${peerid}'),
        headers: {"Accept": "application/json"});
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }

  void _sendMessage(){

    if (textEditingController.text.isNotEmpty) {
      widget.channel.sink.add(json.encode({
        'message': textEditingController.text,
        'receiver' : peerId,
        'sender' : myid
      }));
      textEditingController.clear();
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    messages = List();
    GetMessage(myid, peerId).then((data){
      setState(() {
        messages = data;
      });
    });

    widget.channel.stream.listen((data){
      Map<String, dynamic> datamap = json.decode(data);
      if(mounted){
        setState(() {
          messages.insert(0, datamap);
        });
      }
    });
    super.initState();
  }

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
          '${peernickname} 님과의 대화',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          buildListMessage(),
        ],
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
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: '텍스트를 입력해주세요',
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                _sendMessage();
              },
              icon: Icon(
                Icons.send,
                size: 30,
                color: Color.fromRGBO(236, 128, 130, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(var ds){
    return (ds['sender'] == myid || ds['sender'] == mynickname)?Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Text(
            (ds['message'] != null)? ds['message']: '',style: TextStyle(color: Colors.amber),
          ),
        ),
      ],
    ):Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            (ds['message'] != null)? ds['message']: '',style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  buildListMessage() {
    if(messages == null){
      return Container();
    }
    return Flexible(
      child:ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: messages.length,
          reverse: true,
          itemBuilder:(context, index){
            return buildItem(messages[index]);
          }
      ),
    );
  }
}
