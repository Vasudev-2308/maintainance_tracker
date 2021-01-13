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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User View"),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  height: 35,
                ),
                FloatingActionButton.extended(
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
                )
              ],
            ),
          ),
        ));
  }
}
