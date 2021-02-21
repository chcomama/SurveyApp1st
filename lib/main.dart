
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_project/router.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      //ทำให้debugmodeหาย
      debugShowCheckedModeBanner: false,
      routes: myRoutes,
      initialRoute: '/authen',
    );
  }
}
