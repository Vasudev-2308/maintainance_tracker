import 'package:flutter/material.dart';
import 'package:maintainance_tracker/authentication/register.dart';
import 'package:maintainance_tracker/shared/loading.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wavy2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(70, 150, 0, 0),
            child: Text(
              "Maintainance Tracker",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new FloatingActionButton.extended(
                  heroTag: "cont",
                  onPressed: () {
                    Navigator.of(context).pushNamed("/loading");
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Continue to Payment",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  backgroundColor: Colors.purple[800],
                ),
                SizedBox(
                  height: 20,
                ),
                new FloatingActionButton.extended(
                  heroTag: "google",
                  onPressed: () {},
                  label: Text(
                    "Sign-Up with Google",
                    style: TextStyle(fontSize: 20),
                  ),
                  icon: Icon(
                    Icons.mail_sharp,
                    size: 30,
                  ),
                  backgroundColor: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                new FloatingActionButton.extended(
                  heroTag: "phone",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Register()));
                  },
                  label: Text(
                    "Sign-Up with Phone",
                    style: TextStyle(fontSize: 20),
                  ),
                  icon: Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  backgroundColor: Colors.green[800],
                ),
              ],
            ),
          ),
        ]));
  }
}
