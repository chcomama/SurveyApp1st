import 'package:flutter/material.dart';
import 'package:survey_project/utility/my_style.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Customer'),
        backgroundColor: MyStyle().primaryColor,
      ),
    );
  }
}
