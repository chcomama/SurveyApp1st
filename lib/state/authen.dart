import 'dart:ui';

import 'package:flutter/material.dart';
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
      floatingActionButton: buildRegister(),
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
      onPressed: ()=> Navigator.pushNamed(context, '/register'),
      child: Text(
        'New Register',
      ));

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: MyStyle().darkColor,
        onPressed: () => Navigator.pushNamed(context, '/myService'),
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
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(  onChanged: (value) {
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
}
