import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
                child: Swiper(
                  itemBuilder: (BuildContext, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: new Image.asset('Images/juhee$index.jpg',
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
