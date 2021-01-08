import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPhone extends StatefulWidget {
  LoadingPhone({Key key}) : super(key: key);

  @override
  _LoadingPhoneState createState() => _LoadingPhoneState();
}

class _LoadingPhoneState extends State<LoadingPhone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), () => Navigator.of(context).pushNamed("/home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.green,
          size: 70,
        ),
      ),
    );
  }
}
