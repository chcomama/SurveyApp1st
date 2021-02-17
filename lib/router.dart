import 'package:flutter/material.dart';
import 'package:survey_project/state/addcustomer.dart';
import 'package:survey_project/state/authen.dart';
import 'package:survey_project/state/customerList.dart';

final Map<String, WidgetBuilder> myRoutes = {

'/customerList':(BuildContext context)=> customerList(),
'/addCustomer':(BuildContext context)=> addCustomer(),

'/authen':(BuildContext context)=> Authen(),
};
