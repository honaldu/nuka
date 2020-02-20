import 'package:flutter/material.dart';
import 'package:nuka/SizeMultiplier.dart';
import 'package:nuka/ProfileInfoJuhee.dart';

class Ideal extends StatefulWidget {
  @override
  _IdealState createState() => _IdealState();
}

class _IdealState extends State<Ideal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          '이상형 만나기',
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
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0 * SizeConfig.widthMultiplier,
                    2 * SizeConfig.heightMultiplier,
                    0 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                      width: 20 * SizeConfig.widthMultiplier,
                      height: 5 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 130, 130, 1),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                                offset: Offset(3.0, 3.0))
                          ]),
                      child: Center(
                        child: Text(
                          'Today',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 4 * SizeConfig.widthMultiplier),
                        ),
                      )),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(100, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new ProFileInfo()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1 * SizeConfig.heightMultiplier),
                      child: Container(
                        width: 10 * SizeConfig.widthMultiplier,
                        height: 30 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey[300]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(3.0, 3.0))
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'Images/juhee$index.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
