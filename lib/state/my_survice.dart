import 'package:flutter/material.dart';
import 'package:survey_project/utility/my_style.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer List'),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTile(
              onTap: () {
              //Signout
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
            ),
          ],
        ),
      ),
    );
  }
}
