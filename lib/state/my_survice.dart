import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:survey_project/state/customerList.dart';
import 'package:survey_project/state/reportSurvey.dart';
import 'package:survey_project/utility/my_style.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String nameLogin, typeUser;
  Widget currentWidget = CustomerList();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameLoginAndTypeUser();
  }

//หาชื่อที่Login
  Future<Null> findNameLoginAndTypeUser() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          nameLogin = event.displayName;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text('Survey App'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Column(
              children: [
                buildUserAccountsDrawerHeader(),
                buildMenuReport(),
                buildMenuCustomerList(),
              ],
            ),
            buildColumnSignOut(context),
          ],
        ),
      ),
      body: currentWidget,
    );
  }

  ListTile buildMenuReport() {
    return ListTile(
      onTap: () {
        setState(() {
          currentWidget = ReportSurvey();
        });
        Navigator.pop(context);
      },
      leading: Icon(Icons.insert_chart),
      title: Text('Report'),
      subtitle: Text('รายงานสำรวจ'),
    );
  }

  ListTile buildMenuCustomerList() {
    return ListTile(
      onTap: () {
        setState(() {
          currentWidget = CustomerList();
        });
        Navigator.pop(context);
      },
      leading: Icon(Icons.store_mall_directory),
      title: Text('Customer List'),
      subtitle: Text('รายชื่อร้านค้า'),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      //decoration: BoxDecoration(color: MyStyle().primaryColor),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/wall.png'), fit: BoxFit.cover),
      ),
      currentAccountPicture: Image.asset('images/logo.png'),
      accountName: Text(nameLogin == null ? 'Name ' : nameLogin),
      accountEmail: Text('TypeUser :'),
    );
  }

  Column buildColumnSignOut(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyStyle().buildSignOut(context),
      ],
    );
  }
}
