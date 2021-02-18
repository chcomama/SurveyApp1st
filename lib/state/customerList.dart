import 'package:flutter/material.dart';
import 'package:survey_project/utility/my_style.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: MyStyle().primaryColor,
        onPressed: () => Navigator.pushNamed(context, '/addCustomer'),
        child: Icon(Icons.add),
      ),
      body: Text('Customer List'),
    );
  }
}
