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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.history,
                        color: Colors.deepPurple,
                        size: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
