import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomBar/BottomBarMain.dart';
import 'ConfirmingPage.dart';
import 'ProfileSettingPage.dart';
import 'SizeConfig.dart';
import 'package:http/http.dart' as http;

import 'dart:ui';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  SharedPreferences prefs;
  String errorMessage;

  //자동 로그인을 위해 로그인이 되어있다면 로그인 창 스킵
  isSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('isactive') != null) {
      //이미 활성화된 유저일시에 바로 메인페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new MainPage()),
      );
    } else {
      //활성화 서버에서 판단함.

      isActive(false);
    }
  }

  GetUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.encodeFull('${ServerIp}auth/user/${prefs.getInt('id')}'),
        headers: Header);
    var utf8convert = utf8.decode(response.bodyBytes); //한글화

    return json.decode(utf8convert);
  }

  isActive(bool Sigin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var ds = await GetUserProfile();

    if (ds['active'] == true) {
      prefs.setInt("active", 1);
      prefs.setString('nickname', ds['nickname']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new MainPage()));
    } else if (ds['nickname'] != null) {
      //서버에서 닉네임 설정이 되어있는지 확인한뒤 설정이 되어있다면 웨이팅 페이지로 이동
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new Confirming()));
    } else if (Sigin == true) {
      //서버에서 닉네임 설정이 되어있는지 확인한뒤 설정이 되어있지않다면 프로필 설정으로 이동
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => new ProfileSetting()));
    } else {
      return null;
    }
  }

  //구글 로그인
  GoogleLogin() async {
    GoogleSignInAccount account = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    AuthResult authResult = await auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    FirebaseUser userinfo = await auth.currentUser();
    IdTokenResult idTokenResult = await user.getIdToken();

    //해당 구글 로그인 이메일
    String email = authResult.user.email;
    //해당 구글 로그인 토큰ID
    String token = authResult.user.uid;

    PostSign(email, token);
  }

  //서버로 이메일과 토큰을 보내 가입 및 로그인을 진행함
  //추후에 가입된 회원일시 프로필 작성 페이지 생략
  PostSign(String email, String token) async {
    prefs = await SharedPreferences.getInstance();

    final Map<String, dynamic> Data = {"email": email, "token": token};

    var response = await http.post(SignUrl, body: json.encode(Data));

    // 200 ok. 정상 동작임을 알려준다.

    if (response.statusCode == 200) {
      var utf8convert = utf8.decode(response.bodyBytes); //한글화
      Map data = json.decode(utf8convert);
      await prefs.setString('email', data['email']);
      await prefs.setString('token', data['token']);
      await prefs.setInt('id', data['id']);

      //서버에서 확인
      isActive(true);
    } else {
      print(response.statusCode);
      print(utf8.decode(response.bodyBytes));
      //나중에 로그인 실패 메세지 토스트로 만들기
      return null;
    }
  }

  //애플 로그인
  void AppleSign() async {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:

        // Store user ID
//        await FlutterSecureStorage()
//            .write(key: "userId", value: result.credential.user);

        PostSign(result.credential.email, result.credential.user);

        break;

      case AuthorizationStatus.error:
        print("Sign in failed: ${result.error.localizedDescription}");
        //나중에 토스트 메세지로 실패이유 띄우면됨
        setState(() {
          errorMessage = "Sign in failed";
        });
        break;

      case AuthorizationStatus.cancelled:
        print('User cancelled');
        break;
    }
  }

//  isSignInApple() async {
//    prefs = await SharedPreferences.getInstance();
//    String token = prefs.getString('token');
//
//    if (token == null) {
//      print("No stored user ID");
//      return;
//    }
//
//    final credentialState = await AppleSignIn.getCredentialState(token);
//    switch (credentialState.status) {
//      case CredentialStatus.authorized:
//        print("getCredentialState returned authorized");
//        break;
//
//      case CredentialStatus.error:
//        print(
//            "getCredentialState returned an error: ${credentialState.error.localizedDescription}");
//        break;
//
//      case CredentialStatus.revoked:
//        print("getCredentialState returned revoked");
//        break;
//
//      case CredentialStatus.notFound:
//        print("getCredentialState returned not found");
//        break;
//
//      case CredentialStatus.transferred:
//        print("getCredentialState returned not transferred");
//        break;
//    }
//  }

  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  @override
  void initState() {
    // TODO: implement initState
    isSignIn();
    if (Platform.isIOS) {
      AppleSignIn.onCredentialRevoked.listen((_) {
        print("Credentials revoked");
      });
    }
//    isSignInApple();
    super.initState();

    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        // save the token  OR subscribe to a topic here
//        print(data);
      });

      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: Container(
        width: double.maxFinite,
        decoration: new BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('Images/juhee0.jpg'),
                fit: BoxFit.cover)),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            20 * SizeConfig.heightMultiplier,
                            0,
                            8 * SizeConfig.heightMultiplier),
                        child: Text(
                          'NuKa',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 130, 130, 1),
                              fontSize: 10 * SizeConfig.heightMultiplier),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                GoogleLogin();
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  0 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                child: Container(
                                  width: 65 * SizeConfig.widthMultiplier,
                                  height: 8 * SizeConfig.heightMultiplier,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        8.0 * SizeConfig.heightMultiplier),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          4 * SizeConfig.widthMultiplier,
                                          0 * SizeConfig.heightMultiplier,
                                          1 * SizeConfig.widthMultiplier,
                                          0 * SizeConfig.heightMultiplier,
                                        ),
                                        child: Image.asset(
                                          'Images/google.png',
                                          height: 7 * SizeConfig.heightMultiplier,
                                          width: 7 * SizeConfig.widthMultiplier,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5 * SizeConfig.widthMultiplier,
                                      ),
                                      Text(
                                        'Sign In With Google',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize:
                                              4 * SizeConfig.widthMultiplier,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            (Platform.isIOS)
                                ? InkWell(
                              onTap: () async {
                                AppleSign();
                              },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      0 * SizeConfig.widthMultiplier,
                                      1 * SizeConfig.heightMultiplier,
                                      0 * SizeConfig.widthMultiplier,
                                      1 * SizeConfig.heightMultiplier,
                                    ),
                                    child: Container(
                                      width: 65 * SizeConfig.widthMultiplier,
                                      height: 8 * SizeConfig.heightMultiplier,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            8.0 * SizeConfig.heightMultiplier),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              4 * SizeConfig.widthMultiplier,
                                              0 * SizeConfig.heightMultiplier,
                                              1 * SizeConfig.widthMultiplier,
                                              0 * SizeConfig.heightMultiplier,
                                            ),
                                            child: Image.asset(
                                              'Images/apple.png',
                                              height: 7 * SizeConfig.heightMultiplier,
                                              width: 7 * SizeConfig.widthMultiplier,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5 * SizeConfig.widthMultiplier,
                                          ),
                                          Text(
                                            'Sign In With Apple',
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize:
                                              4 * SizeConfig.widthMultiplier,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                : Container(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      new ProfileSetting()),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                  0 * SizeConfig.widthMultiplier,
                                  1 * SizeConfig.heightMultiplier,
                                ),
                                child: Container(
                                  width: 65 * SizeConfig.widthMultiplier,
                                  height: 8 * SizeConfig.heightMultiplier,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        8.0 * SizeConfig.heightMultiplier),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          4 * SizeConfig.widthMultiplier,
                                          0 * SizeConfig.heightMultiplier,
                                          1 * SizeConfig.widthMultiplier,
                                          0 * SizeConfig.heightMultiplier,
                                        ),
                                        child: Image.asset(
                                          'Images/facebook.png',
                                          height: 7 * SizeConfig.heightMultiplier,
                                          width: 7 * SizeConfig.widthMultiplier,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3 * SizeConfig.widthMultiplier,
                                      ),
                                      Text(
                                        'Sign In With Facebook',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize:
                                          4 * SizeConfig.widthMultiplier,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
