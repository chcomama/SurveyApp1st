import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:survey_project/main.dart';

class MyStyle {
  // Color darkColor = Colors.lightBlue[900];
  // Color primaryColor = Colors.lightBlue[300];
  // Color lightColor = Colors.lightBlue;

  Color darkColor = Color(0xff0086c3);
  Color primaryColor = Color(0xff29b6f6);
  Color lightColor = Color(0xff73e8ff);

  TextStyle whiteStyle() => TextStyle(color: Colors.white);
  TextStyle redStyle() => TextStyle(
    color: Colors.red.shade700,
    fontWeight: FontWeight.bold,
  );

 Widget buildSignOut(BuildContext context)  {
    return ListTile(
            onTap: () async {
              //Signout
              await Firebase.initializeApp().then((value) async {
                await FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/authen', (route) => false));
              });
            },
            tileColor: Colors.red[500],
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: Text(
              'Sign Out',
              style: MyStyle().whiteStyle(),
            ),
          );
  }

  MyStyle();
}
