import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:survey_project/utility/dialog.dart';
import 'package:survey_project/utility/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double screen;
  String name, mail, password;
  double lat, long;
  bool statusProcess = false;

  Container buildName() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        //ค่าของช่อง Name
        onChanged: (value) => name = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.fingerprint,
            color: MyStyle().darkColor,
          ),
          hintText: 'Name',
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
        onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.lock_open_outlined,
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

  Container buildMail() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        onChanged: (value) => mail = value.trim(),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          prefixIcon: Icon(
            Icons.mail_outline,
            color: MyStyle().darkColor,
          ),
          hintText: 'Email',
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

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},child: Icon(Icons.upload_file),
      // ),//ปุ่มด้านล่างจอ
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.cloud_upload_outlined),
            onPressed: () {
              print(
                  '*********name = $name , user = $mail , password = $password ');
              if ((name == null || name.isEmpty) ||
                  (mail?.isEmpty ?? true) ||
                  (password?.isEmpty ?? true)) {
                normalDialog(context, 'Have Space ? Please Fill Every  Blank');
              } else {
                print('No space jaaa  ');
                // setState(() {
                //   statusProcess = true;
                // });
                registerAndInsertData();
              }
            },
          )
        ],
        backgroundColor: MyStyle().primaryColor,
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          children: [
            buildName(),
            buildMail(),
            buildPassword(),
          ],
        ),
      ),
    );
  }

  Future<Null> registerAndInsertData() async {
    await Firebase.initializeApp().then((value) async {
      print('Firebasee---------------------');

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: password)
          .then((value) async {
        print('****************Register success');
        await value.user.updateProfile(displayName: name).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/myService', (route) => false));
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
