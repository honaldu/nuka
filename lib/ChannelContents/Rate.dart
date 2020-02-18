import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {

  GetTopRatingUser() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}auth/toprating/${prefs.getInt('id')}'),
        headers: Header);
    var utf8convert= utf8.decode(response.bodyBytes);//한글화
    return json.decode(utf8convert);
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          '평가 좋은 이성 만나기',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color.fromRGBO(255, 130, 130, 1),
                ),
                child: Text(
                  'Today',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FutureBuilder(
                future: GetTopRatingUser(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Container();
                  }
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: (itemWidth / itemHeight),
                    children: List.generate(snapshot.data.length, (index) {
                      var ds = snapshot.data[index];
                      return Container(
                        margin: EdgeInsets.all(1.0),
                        child: Center(
                          child: (ds['image1'] != null)?ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'http://127.0.0.1:8000'+ds['image1'],
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                          ):Icon(
                              Icons.person
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
