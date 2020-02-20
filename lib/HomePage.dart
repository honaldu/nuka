import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'SizeMultiplier.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:nuka/Styling.dart';

class MyImageModel {}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int imagenumber = 0;
  List<String> _image = ['juhee','Sana'];
  void changeNumber() {
    setState(() {
      imagenumber = imagenumber + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                  2 * SizeConfig.widthMultiplier,
                  2 * SizeConfig.heightMultiplier,
                  2 * SizeConfig.widthMultiplier,
                  0 * SizeConfig.heightMultiplier,
                ),
                child: SizedBox(
                  height: 60 * SizeConfig.heightMultiplier,
                  width: 80 * SizeConfig.widthMultiplier,
                  child: Swiper(
                    itemBuilder: (BuildContext, int index) {
                      return Stack(
                        children: <Widget>[
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: AssetImage(
                                'Images/juhee$imagenumber.jpg',
                              ),
                              fit: BoxFit.fill,
                              fadeInDuration: Duration(seconds: 10000),
                              fadeOutDuration: Duration(seconds: 10000),
                              fadeInCurve: Curves.bounceIn,
                              fadeOutCurve: Curves.bounceOut,
                              height: 90 * SizeConfig.widthMultiplier,
                              width: 60 * SizeConfig.heightMultiplier,
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: 1,
                    itemHeight: 50 * SizeConfig.heightMultiplier,
                    itemWidth: 90 * SizeConfig.widthMultiplier,
                    layout: SwiperLayout.STACK,
                    autoplay: true,
                    autoplayDelay: 10000,
                  ),
                ),
              ),
              SizedBox(
                height: 2 * SizeConfig.heightMultiplier,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0)),
                      ],
                    ),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Colors.red,
                          child: Container(
                            width: 23 * SizeConfig.widthMultiplier,
                            height: 23 * SizeConfig.widthMultiplier,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20 * SizeConfig.widthMultiplier,
                            ),
                          ),
                          onTap: () {
                            changeNumber();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20 * SizeConfig.widthMultiplier,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0)),
                      ],
                    ),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        child: InkWell(
                          splashColor: Colors.black,
                          child: Container(
                            width: 23 * SizeConfig.widthMultiplier,
                            height: 23 * SizeConfig.widthMultiplier,
                            child: Icon(
                              Icons.clear,
                              color: Colors.black,
                              size: 20 * SizeConfig.widthMultiplier,
                            ),
                          ),
                          onTap: () {
                            changeNumber();
                          },
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
    );
  }
}
