import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_project/model/user_model.dart';
import 'package:survey_project/state/customerList.dart';
import 'package:survey_project/state/my_survice.dart';
import 'package:survey_project/utility/dialog.dart';
import 'package:survey_project/utility/my_constant.dart';
import 'package:survey_project/utility/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screen;
  bool status = true;
  String user, password;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      // floatingActionButton: buildRegister(),
      body: Container(
        //BoxDecoration(color: MyStyle().lightColor)  สีล้วน
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.35),
            radius: 0.9,
            colors: <Color>[Colors.white, MyStyle().lightColor],
          ),
        ),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildLogo(),
              buildText(),
              buildUser(),
              buildPassword(),
              buildLogin(),
            ],
          ),
        )),
      ),
    );
  }

  TextButton buildRegister() => TextButton(
      onPressed: () => Navigator.pushNamed(context, '/register'),
      child: Text(
        'New Register',
      ));

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // onPressed: () => Navigator.pushNamed(context, '/myService'),
        // normaldialog
        onPressed: () {
          print('******___user = $user , password =$password');
          if ((user?.isEmpty ?? true) && (password?.isEmpty ?? true)) {
            normalDialog(context, 'Have Space ? Please Fill Every Blank');
          } else if (user?.isEmpty ?? true) {
            normalDialog(context, 'กรอก Username ก่อนจ้า');
          } else if (password?.isEmpty ?? true) {
            normalDialog(context, 'กรอก Password ก่อนจ้า');
          } else {
            checkAuthen();
          }
        },
        child: Text(
          'Login',
          style: MyStyle().whiteStyle(),
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        onChanged: (value) {
          print('value = $value');
          user = value.trim();
          print('user = $user');
        },
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.face,
            color: MyStyle().darkColor,
          ),
          hintText: 'User',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        onChanged: (value) {
          print('value = $value');
          password = value.trim();
          print('password = $password');
        },
        obscureText: status,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: status
                ? Icon(
                    Icons.remove_red_eye,
                    color: MyStyle().darkColor,
                  )
                : Icon(
                    Icons.remove_red_eye_outlined,
                    color: MyStyle().darkColor,
                  ),
            onPressed: () {
              setState(() {
                status = !status;
              });
              print('You click red eye **************** status = $status');
            },
          ),
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.lock,
            color: MyStyle().darkColor,
          ),
          hintText: 'Password',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Text buildText() => Text(
        'SurveyApp',
        style: TextStyle(
          fontSize: 30,
          //ใส่สีแบบธรรมดา
          // color: Colors.blue[400],
          color: MyStyle().darkColor,
        ),
      );

  Container buildLogo() {
    return Container(
      width: screen * 0.33,
      child: Image.asset('images/logo.png'),
    );
  }

  //async ใส่รหว่าง()กับ{}
  Future<Null> checkAuthen() async {
    String urlAPI =
        'https://smicb.osotspa.com/smicprogram/QAS/SurveyApp/CheckUser.php?isAdd=true&uid=$user&password=$password';
    print('url___________***>$urlAPI');
    try {
      Response response = await Dio().get(urlAPI);
      print('******res***** = $response');

      var result = json.decode(response.data);

      if (result == 0) {
        normalDialog(context, 'Password ไม่ถูกต้อง ลองใหม่จ้า ');
      } else if (result == 1) {
        normalDialog(context, 'Username ไม่ถูกต้อง ลองใหม่จ้า ');
      } else {
        for (var map in result) {
          UserModel userModel = UserModel.fromJson(map);
          String chk_user = userModel.userName;

        //  print('user--> $user  chk_user---> $chk_user');
          if (user == chk_user) {
            routeToService(MyService(), userModel);
          }
        }
      }
    } catch (e) {}
  }

  Future<Null> routeToService(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(MyConstant().keyUsername, userModel.userName);
    preferences.setString(MyConstant().keyRouteNo, userModel.routeNo);
    preferences.setString(MyConstant().keyName, userModel.sName);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
}
