import 'dart:convert';
import 'dart:io';

import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nuka/Utils/rest_api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProfileSettingPage.dart';
import 'package:http/http.dart' as http;


class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoggedIn = false;
  SharedPreferences prefs;
  String errorMessage;


  //자동 로그인을 위해 로그인이 되어있다면 로그인 창 스킵
  isSignIn() async {
    isLoggedIn = await googleSignIn.isSignedIn();
    if(isLoggedIn){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new ProfileSetting()),
      );
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
    FirebaseUser userinfo =await auth.currentUser();
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

    final Map<String, dynamic> Data = {
      "email": email,
      "token": token};

    var response = await http.post(SignUrl, body: json.encode(Data));

    // 200 ok. 정상 동작임을 알려준다.

    if(response.statusCode == 200){
      var utf8convert= utf8.decode(response.bodyBytes);//한글화
      Map data = json.decode(utf8convert);
      await prefs.setString('email', data['email']);
      await prefs.setString('token', data['token']);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new ProfileSetting()),
      );
    }else{
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



  @override
  void initState() {
    // TODO: implement initState
    isSignIn();
    AppleSignIn.onCredentialRevoked.listen((_) {
      print("Credentials revoked");
    });
//    isSignInApple();
    super.initState();
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
              Container(
                child: Text(
                  'NuKa',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(238, 146, 130, 1.0),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  GoogleLogin();
                },
              ),
              (Platform.isIOS)?SignInButton(
                Buttons.Apple,
                onPressed: () async {
                  AppleSign();
                },
              ):Container(),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new ProfileSetting()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
