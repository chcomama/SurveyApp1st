import 'package:flutter/material.dart';
import 'package:survey_project/state/customerList.dart';
import 'package:survey_project/utility/my_style.dart';


class survey_first extends StatefulWidget {
 final CustomerList customerModel;
  survey_first({Key key, this.customerModel}) : super(key: key);

  @override
  _survey_firstState createState() => _survey_firstState();
}

class _survey_firstState extends State<survey_first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey First'),
        backgroundColor: MyStyle().primaryColor,
      ),
    );
  }
}