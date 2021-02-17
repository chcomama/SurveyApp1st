import 'package:flutter/material.dart';
import 'package:survey_project/state/addcustomer.dart';
import 'package:survey_project/state/authen.dart';
import 'package:survey_project/state/customerList.dart';
import 'package:survey_project/state/my_survice.dart';

final Map<String, WidgetBuilder> myRoutes = {

'/customerList':(BuildContext context)=> customerList(),
'/addCustomer':(BuildContext context)=> addCustomer(),
'/myService':(BuildContext context)=> MyService(),
'/authen':(BuildContext context)=> Authen(),
};
