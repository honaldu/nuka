import 'package:flutter/material.dart';
import 'SizeMultiplier.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          'Your Point :10 Point',
          style: TextStyle(
            fontSize: 4 * SizeConfig.widthMultiplier,
            color: Color.fromRGBO(236, 128, 130, 1.0),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[InkWell(
                onTap: () {},
                child: Container(
                  width: 80 * SizeConfig.widthMultiplier,
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
                      border: Border.all(color: Colors.grey[300]),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          color: Color.fromRGBO(236, 128, 130, 1.0),
                          size: 8 * SizeConfig.widthMultiplier,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '15 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '\$ 5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),InkWell(
                onTap: () {},
                child: Container(
                  width: 80 * SizeConfig.widthMultiplier,
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
                      border: Border.all(color: Colors.grey[300]),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          color: Color.fromRGBO(236, 128, 130, 1.0),
                          size: 8 * SizeConfig.widthMultiplier,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '15 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '\$ 5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),InkWell(
                onTap: () {},
                child: Container(
                  width: 80 * SizeConfig.widthMultiplier,
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
                      border: Border.all(color: Colors.grey[300]),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          color: Color.fromRGBO(236, 128, 130, 1.0),
                          size: 8 * SizeConfig.widthMultiplier,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '15 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '\$ 5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),],
            ),
          ),
        ],
      ),
    );
  }
}
