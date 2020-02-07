import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'ConfirmingPage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ProfileSetting extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
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
                  height: 300.0,
                  width: 300.0,
                  child: Swiper(
                    itemBuilder: (BuildContext, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: new Image.asset('Images/Profile.png',
                            fit: BoxFit.fill),
                      );
                    },
                    itemCount: 3,
                    itemHeight: 300,
                    itemWidth: 300,
                    layout: SwiperLayout.TINDER,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'NickName',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Flexible(
                        child: Container(
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '별명을 입력해 주세요',
                                hintStyle: TextStyle(color: Colors.grey[300])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Birth',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 80,
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
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Height(cm)',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 120,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
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
                              hintStyle: TextStyle(color: Colors.grey[300])),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Body Shape',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      DropdownButton<String>(
                        value: _dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 16,
                        style: TextStyle(fontSize: 15, color: Colors.black),
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
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Education',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 75,
                      ),
                      DropdownButton<String>(
                        value: _dropdownValue2,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 16,
                        style: TextStyle(fontSize: 15, color: Colors.black),
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
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Job',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: Container(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '직업을 입력해 주세요',
                                hintStyle: TextStyle(color: Colors.grey[300])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Charateristic',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text('성격을 선택해 주세요'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '긍정적',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '현실적',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '외향적',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '내향적',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: 300,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Hobby',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text('취미를 선택해 주세요'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '영화감상',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '운동',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '독서',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '게임',
                                  style: TextStyle(color: Colors.white),
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
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '여행',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '요리',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '음악감상',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color.fromRGBO(255, 130, 130, 1),
                              ),
                              child: Center(
                                child: Text(
                                  '산책',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Self Introduce',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.start,
                            maxLines: 7,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '자기소개를 입력해 주세요',
                                hintStyle: TextStyle(color: Colors.grey[300])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new Confirming()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color.fromRGBO(255, 130, 130, 1),
                    ),
                    child: Center(
                      child: Text(
                        '작성완료',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
