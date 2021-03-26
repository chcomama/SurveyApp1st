
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_project/state/customerList.dart';
import 'package:survey_project/state/reportSurvey.dart';
import 'package:survey_project/utility/my_style.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String nameLogin, userName, routeNo;
  Widget currentWidget = CustomerList();
  @override
  void initState() {
    
    super.initState();
    findUser();
  }

//หาชื่อที่Login
  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userName = preferences.getString('UserName');
      routeNo = preferences.getString('RouteNo');
      nameLogin = preferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text('User : $userName'),
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
      accountName: Text(userName == null ? 'Name ' : userName),
      accountEmail: Text(''),
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
