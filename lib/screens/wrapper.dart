import 'package:flutter/material.dart';
import 'package:maintainance_tracker/screens/start.dart';
//import 'package:maintainance_tracker/shared/loading.dart';

// ignore: must_be_immutable
class Wrapper extends StatelessWidget {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: StartPage());
  }
}
