import 'package:flutter/material.dart';
import 'package:maintainance_tracker/screens/homepage.dart';
import 'package:maintainance_tracker/screens/start.dart';
import 'package:maintainance_tracker/screens/transactions.dart';
import 'package:maintainance_tracker/screens/user.dart';
import 'package:maintainance_tracker/screens/wrapper.dart';
import 'package:maintainance_tracker/shared/loading.dart';
import 'package:maintainance_tracker/shared/phoneAuth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
      title: "Maintainance",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.deepPurple,
      ),
      initialRoute: '/start',
      routes: {
        '/start': (context) => StartPage(),
        '/home': (context) => Home(),
        '/loading': (context) => Loading(),
        '/transactions': (context) => Transactions(),
        '/user': (context) => UserProfile(),
        '/phone': (context) => LoadingPhone(),
      },
    );
  }
}
