import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AlarmPage extends StatefulWidget {

  final WebSocketChannel channel;

  AlarmPage({Key key, @required this.channel}):super(key:key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  TextEditingController _controller = TextEditingController();


  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      print(_controller.text);
      widget.channel.sink.add(json.encode({
        'message': _controller.text,
      }));
    }
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
          'Story Alarm',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/15,
              child: StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Container();
                  }
                  print(snapshot.data);
                  return Container(
                    child: Text(
                      (snapshot.data != null)?snapshot.data:'',
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }
}
