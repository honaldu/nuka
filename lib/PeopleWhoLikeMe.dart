import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LikeMe extends StatefulWidget {
  @override
  _LikeMeState createState() => _LikeMeState();
}

class _LikeMeState extends State<LikeMe> {


  Future GetWhoLikeMe() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}auth/relation/${prefs.getInt('id')}/l'),
        headers: Header);
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }

  GetUser(int userid) async {
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}auth/user/$userid'),
        headers: Header);
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
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
          '나를 좋아하는 사람들',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          FutureBuilder(
            future: GetWhoLikeMe(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Container();
              }
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(
                  snapshot.data.length,
                  (index) {
                    var ds = snapshot.data[index];
                    return FutureBuilder(
                      future: GetUser(ds['from_user']),
                      builder: (context, snapshot2) {
                        var userds = snapshot2.data;
                        return Center(
                          child: (userds['image'] != null)?Image.network(userds['image']):Icon(Icons.person),
                        );
                      }
                    );
                  },
                ),
              );
            }
          ),
        ],
      ),

    );
  }
}
