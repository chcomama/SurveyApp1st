import 'package:flutter/material.dart';
import 'package:survey_project/utility/my_style.dart';

class customerList extends StatefulWidget {
  @override
  _customerListState createState() => _customerListState();
}

class _customerListState extends State<customerList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle().primaryColor,
      appBar: AppBar(
        title: Text('Customer List'),
      ),
     
      
    );
  }
}
