import 'package:flutter/material.dart';
import 'package:maintainance_tracker/screens/edit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Unable to Go Back to Login Screen"),
            duration: Duration(seconds: 3),
          ));
        },
        child: Scaffold(
          body: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/wavy3.png'),
                          fit: BoxFit.cover)),
                  height: MediaQuery.of(context).size.height / 1.66,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 70, 0, 0),
                  child: Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
