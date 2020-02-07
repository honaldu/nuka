

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryWriting extends StatefulWidget {
  @override
  _StoryWritingState createState() => _StoryWritingState();
}

class _StoryWritingState extends State<StoryWriting> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String content;
  File ImageFile;
  String imagepath;
  SharedPreferences prefs;
  http.MultipartFile multipartFile;

  Future GetImage()async{
    ImageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  PostIntData(int postid) async {
    prefs = await SharedPreferences.getInstance();



    Map<String, dynamic> Data = {
      "author": prefs.getInt('id'),
      "user": prefs.getInt('id')};


    String addr = '${ServerIp}api/story/${prefs.getInt('id')}/${postid}/';


    var response = await http.patch(addr, headers: Header,body: json.encode(Data));

    // 200 ok. 정상 동작임을 알려준다.

    if(response.statusCode == 200){
      var utf8convert= utf8.decode(response.bodyBytes);//한글화
      Map data = json.decode(utf8convert);
      Navigator.pop(context);
    }else{
      print(response.statusCode);
      print(utf8.decode(response.bodyBytes));
      //나중에 로그인 실패 메세지 토스트로 만들기
      return null;
    }
  }

  PostContent() async {
    if(content != null){
      prefs = await SharedPreferences.getInstance();
      if(ImageFile != null){
        imagepath = ImageFile.path;
      }

      String addr = '${ServerIp}api/story/${prefs.getInt('id')}/';
      var postUri = Uri.parse(addr);

      http.MultipartRequest request = http.MultipartRequest("POST", postUri);
      if(ImageFile != null){
        multipartFile = await http.MultipartFile.fromPath('image', imagepath);
      }


      request.fields['content'] = content;
      request.fields['email'] = prefs.getString('email');
      //나중에 프로필 설정 끝나면 바꾸기
      request.fields['gender'] = "True";
      if(ImageFile != null){
        request.files.add(multipartFile);
      }

      request.send().then((result) async {
        http.Response.fromStream(result).then((response){
          if(response.statusCode == 200 || response.statusCode == 201){
            var utf8convert= utf8.decode(response.bodyBytes);//한글화
            Map data = json.decode(utf8convert);
            PostIntData(data['id']);
            return null;
          }else{
            print(response.body);
            //나중에 오류라는 토스트 메세지 넣기
            return null;
          }
        });
      });



    }else{
      //나중에 내용을 입력하라는 토스트메세지 넣기
      print('내용입력');
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
          'Write Story',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(236, 128, 130, 1),
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          InkWell(
            onTap: (){
              PostContent();
            },
              child: Text('완료', style: TextStyle(color: Colors.black,fontSize: 30),)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Form(
                  key: _formkey,
                  child: TextFormField(
                    style: TextStyle(
                        fontSize:MediaQuery.of(context).textScaleFactor*20,
                        color: Colors.black),
                    controller: null,
                    maxLength: 100,
                    maxLines: null,
                    decoration: InputDecoration(
                      counterText: '',
                      hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor*20,
                        color: Colors.black,
                      ),
                      hintText: '내용을 입력해주세요.',
                      border:InputBorder.none,
                    ),
                    onChanged: (value)=> content = value,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: (ImageFile != null)?Image.file(ImageFile):Container(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FlatButton(
          onPressed: () {
            GetImage();
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.photo_filter,
                  color: Color.fromRGBO(236, 128, 130, 1),
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Add Photos',
                  style: TextStyle(
                      color: Color.fromRGBO(236, 128, 130, 1), fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
