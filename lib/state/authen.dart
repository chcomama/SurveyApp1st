import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:survey_project/utility/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildLogo(),
          buildText(),
          buildUser(),
          buildPassword(),
          buildLogin(),
        ],
      )),
    );
  }


Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: MyStyle().darkColor,
         onPressed: () => Navigator.pushNamed(context, '/customerList'),
       //normaldialog
      //  onPressed: () {
          // print('user = $user , password =$password');
          // if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
          //   normalDialog(context, 'Have Space ? Please Fill Every Blank');
          // } else {
          //   checkAuthen();
          // }
        // },
        child: Text(
          'Login',
          style: MyStyle().whiteStyle(),
        ),
      ),
    );
  }


  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'User',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: MyStyle().darkColor,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: MyStyle().lightColor,
          )),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Password',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: MyStyle().darkColor,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: MyStyle().lightColor,
          )),
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
}
