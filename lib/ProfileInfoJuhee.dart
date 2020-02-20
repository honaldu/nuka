import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'SizeMultiplier.dart';

class ProFileInfo extends StatefulWidget {
  @override
  _ProFileInfoState createState() => _ProFileInfoState();
}

class _ProFileInfoState extends State<ProFileInfo> {
  String _date = "Not Set";
  String _dropdownValue = '보통';
  String _dropdownValue2 = '중졸';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color.fromRGBO(236, 128, 130, 1.0)),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50 * SizeConfig.heightMultiplier,
                  width: 90 * SizeConfig.widthMultiplier,
                  child: Swiper(
                    itemBuilder: (BuildContext, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: new Image.asset('Images/juhee$index.jpg',
                            fit: BoxFit.fill),
                      );
                    },
                    itemCount: 3,
                    itemHeight: 50 * SizeConfig.heightMultiplier,
                    itemWidth: 90 * SizeConfig.widthMultiplier,
                    layout: SwiperLayout.TINDER,
                  ),
                ),
                SizedBox(
                  height: 2 * SizeConfig.heightMultiplier,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'NickName',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            10 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Lovely Juhee',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            21 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Birth',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1980, 1, 1),
                                maxTime: DateTime(2005, 1, 1), onChanged: (date) {
                                  print('change $date');
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                  _date =
                                  '${date.year} - ${date.month} - ${date.day}';
                                  setState(() {});
                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                            ;
                          },
                          child: Text('$_date'),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Height',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            25 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            '158',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            15 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Body Shape',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        DropdownButton<String>(
                          value: _dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 7 * SizeConfig.widthMultiplier,
                          elevation: 20,
                          style: TextStyle(fontSize: 5 * SizeConfig.widthMultiplier, color: Colors.black),
                          onChanged: (String newValue) {
                            setState(() {
                              _dropdownValue = newValue;
                            });
                          },
                          items: <String>['보통', '날씬', '탄탄', '통통']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            19 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Education',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        DropdownButton<String>(
                          value: _dropdownValue2,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 7 * SizeConfig.widthMultiplier,
                          elevation: 20,
                          style: TextStyle(fontSize: 5 * SizeConfig.widthMultiplier, color: Colors.black),
                          onChanged: (String newValue) {
                            setState(() {
                              _dropdownValue2 = newValue;
                            });
                          },
                          items: <String>['중졸', '고졸', '대퇴', '대졸']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Job',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            18 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            '호우쟝 남편입니다만',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 13 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                2 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                1 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                'Characteristic',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 4 * SizeConfig.widthMultiplier),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '긍정적',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '긍정적',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '긍정적',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '긍정적',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 20 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                2 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                1 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                'Hobby',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 4 * SizeConfig.widthMultiplier),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '영화감상',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '운동',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '독서',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '게임',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '여행',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '요래',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '산책',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 17 * SizeConfig.widthMultiplier,
                                height: 5 * SizeConfig.heightMultiplier,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: EdgeInsets.fromLTRB(
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  1 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
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
                                    '음악감상',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        3 * SizeConfig.widthMultiplier,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    width: 80 * SizeConfig.widthMultiplier,
                    height: 30 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            'Self Introduce',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                            1 * SizeConfig.widthMultiplier,
                            1 * SizeConfig.heightMultiplier,
                          ),
                          child: Text(
                            '주희쟝 이쁜거시와오~',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 4 * SizeConfig.widthMultiplier),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    width: 20 * SizeConfig.widthMultiplier,
                    height: 5 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(
                      2 * SizeConfig.widthMultiplier,
                      1 * SizeConfig.heightMultiplier,
                      2 * SizeConfig.widthMultiplier,
                      1 * SizeConfig.heightMultiplier,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
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
                        '대화걸기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 4 * SizeConfig.widthMultiplier,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
