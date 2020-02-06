import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(249, 249, 249, 1),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 300.0,
                width: 300.0,
                child: Carousel(
                  images: [
                    Image.asset('Images/Sana0.jpg'),
                    Image.asset('Images/Sana1.jpg'),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.red,
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Icon(
                            Icons.favorite,
                            size: 70,
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.black,
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Icon(
                            Icons.clear,
                            size: 70,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
