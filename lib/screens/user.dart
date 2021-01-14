import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/wavy4.png'),
                        fit: BoxFit.cover)),
                height: MediaQuery.of(context).size.height / 1.66,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 70, 0, 0),
                child: Text(
                  "User",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(125, 800, 100, 40),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/start');
                  },
                  label: Text(
                    "Log out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ));
  }
}
