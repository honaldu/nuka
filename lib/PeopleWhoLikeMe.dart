import 'package:flutter/material.dart';
import 'ProfileInfoJuhee.dart';
import 'SizeMultiplier.dart';
import 'package:nuka/Styling.dart';

class LikeMe extends StatefulWidget {
  @override
  _LikeMeState createState() => _LikeMeState();
}

class _LikeMeState extends State<LikeMe> {
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
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              100,
              (index) {
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
