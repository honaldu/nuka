import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'ConfirmingPage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'SizeConfig.dart';

class MyButtonModel {
  final String buttonText;
  bool changeButtonColor;
  MyButtonModel({this.buttonText, this.changeButtonColor = false});
}

class ProfileSetting extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  List<bool> _changeColor = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> _character = [
    'Extrovert',
    'Introvert',
    'Optimistic',
    'Realistic'
  ];
  List<String> _hobby = [
    'movie',
    'exercise',
    'reading',
    'game',
    'travel',
    'cooking',
    'Listening',
    'Strolling'
  ];
  String _date = "Not Set";
  String _dropdownValue = '보통';
  String _dropdownValue2 = '중졸';

  List<MyButtonModel> _a = [
    MyButtonModel(buttonText: '외향적'),
    MyButtonModel(buttonText: '내향적'),
    MyButtonModel(buttonText: '긍정적'),
    MyButtonModel(buttonText: '현실적'),
  ];
  List<MyButtonModel> _b = [
    MyButtonModel(buttonText: '영화감상'),
    MyButtonModel(buttonText: '운동'),
    MyButtonModel(buttonText: '독서'),
    MyButtonModel(buttonText: '게임'),
  ];
  List<MyButtonModel> _c = [
    MyButtonModel(buttonText: '여행'),
    MyButtonModel(buttonText: '요리'),
    MyButtonModel(buttonText: '음악감상'),
    MyButtonModel(buttonText: '산책'),
  ];
  List<String> _characterInput = [];
  List<String> _hobbyInput = [];
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
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
                                'No Recent Image',
                                style: TextStyle(
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
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
                                'No Recent Image',
                                style: TextStyle(
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
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
                                'No Recent Image',
                                style: TextStyle(
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ],
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
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
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
                                'No Recent Image',
                                style: TextStyle(
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
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
                                'No Recent Image',
                                style: TextStyle(
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          1 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                            2 * SizeConfig.widthMultiplier,
                            4 * SizeConfig.heightMultiplier,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
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
                                'No Recent Image',
                                style: TextStyle(
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                        Flexible(
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 4 * SizeConfig.widthMultiplier),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '별명을 입력해 주세요',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[300])),
                            ),
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
                                maxTime: DateTime(2005, 1, 1),
                                onChanged: (date) {
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
                        Flexible(
                          child: Container(
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 4 * SizeConfig.widthMultiplier),
                              maxLength: 3,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '키를 입력해 주세요',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[300])),
                            ),
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
                          style: TextStyle(
                              fontSize: 5 * SizeConfig.widthMultiplier,
                              color: Colors.black),
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
                          style: TextStyle(
                              fontSize: 5 * SizeConfig.widthMultiplier,
                              color: Colors.black),
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
                        Flexible(
                          child: Container(
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 4 * SizeConfig.widthMultiplier),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '직업을 입력해 주세요',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[300])),
                            ),
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                6 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                1 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                '성격을 선택해 주세요',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _changeColor[0] = !_changeColor[0];
                                  _characterInput.insert(0, _character[0]);
                                });
                              },
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
                                    color: _changeColor[0]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300],
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(3.0, 3.0))
                                    ]),
                                child: Center(
                                  child: Text(
                                    '외향적',
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
                              onTap: () {
                                setState(() {
                                  _changeColor[1] = !_changeColor[1];
                                  _characterInput.insert(1, _character[1]);
                                });
                              },
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
                                    color: _changeColor[1]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300],
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(3.0, 3.0))
                                    ]),
                                child: Center(
                                  child: Text(
                                    '내향적',
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
                              onTap: () {
                                setState(() {
                                  _changeColor[2] = !_changeColor[2];
                                  _characterInput.insert(2, _character[2]);
                                });
                              },
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
                                    color: _changeColor[2]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                              onTap: () {
                                setState(() {
                                  _changeColor[3] = !_changeColor[3];
                                  _characterInput.insert(3, _character[3]);
                                });
                              },
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
                                    color: _changeColor[3]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300],
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(3.0, 3.0))
                                    ]),
                                child: Center(
                                  child: Text(
                                    '현실적',
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                20 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                                1 * SizeConfig.widthMultiplier,
                                1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                '취미를 선택해 주세요',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3 * SizeConfig.widthMultiplier),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _changeColor[4] = !_changeColor[4];
                                  _hobbyInput.insert(0, _hobby[0]);
                                });
                              },
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
                                    color: _changeColor[4]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                              onTap: () {
                                setState(() {
                                  _changeColor[5] = !_changeColor[5];
                                  _hobbyInput.insert(1, _hobby[1]);
                                });
                              },
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
                                    color: _changeColor[5]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                              onTap: () {
                                setState(() {
                                  _changeColor[6] = !_changeColor[6];
                                  _hobbyInput.insert(2, _hobby[2]);
                                });
                              },
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
                                    color: _changeColor[6]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                              onTap: () {
                                setState(() {
                                  _changeColor[7] = !_changeColor[7];
                                  _hobbyInput.insert(3, _hobby[3]);
                                });
                              },
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
                                    color: _changeColor[7]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _changeColor[8] = !_changeColor[8];
                                  _hobbyInput.insert(4, _hobby[4]);
                                });
                              },
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
                                    color: _changeColor[8]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                              onTap: () {
                                setState(() {
                                  _changeColor[9] = !_changeColor[9];
                                  _hobbyInput.insert(5, _hobby[5]);
                                });
                              },
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
                                    color: _changeColor[9]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300],
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(3.0, 3.0))
                                    ]),
                                child: Center(
                                  child: Text(
                                    '요리',
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
                              onTap: () {
                                setState(() {
                                  _changeColor[10] = !_changeColor[10];
                                  _hobbyInput.insert(6, _hobby[6]);
                                });
                              },
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
                                    color:_changeColor[10]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _changeColor[11] = !_changeColor[11];
                                  _hobbyInput.insert(7, _hobby[7]);
                                });
                              },
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
                                    color: _changeColor[11]
                                        ? Color.fromRGBO(255, 130, 130, 1)
                                        : Colors.grey,
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
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 4 * SizeConfig.widthMultiplier),
                              textAlign: TextAlign.start,
                              maxLines: 7,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '자신을 소개해 주세요',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[300])),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new Confirming()),
                    );
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
                        '작성완료',
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
