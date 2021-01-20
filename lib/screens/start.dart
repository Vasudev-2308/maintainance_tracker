import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:maintainance_tracker/authentication/googlesignin.dart';
import 'package:maintainance_tracker/authentication/register.dart';
import 'package:maintainance_tracker/shared/loading.dart';
import 'package:maintainance_tracker/authentication/googlesignin.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (user == null) {
      signOut();
    } else {
      Navigator.of(context).pushNamed("/loading");
    }
  }

  void click() async {
    await signInwithGoogle().then((user) => {
          passDatatoUser(user),
          this.user = user,
          Navigator.of(context).pushNamed("/home")
        });
  }

  void passDatatoUser(user) {
    this.user = user;
    Navigator.pushNamed(context, "/user",
        arguments: {"name": user.displayName});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[200],
        body: Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.66,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wavy2.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(70, 70, 0, 0),
        child: Row(
          children: [
            // Container(
            //   height: 50,
            //   width: 50,
            //   // decoration: BoxDecoration(
            //   //     image: DecorationImage(
            //   //         image: AssetImage('assets/maintainance.png'),
            //   //         fit: BoxFit.cover)),
            // ),
            Text(
              "Maintainance Tracker",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(50, 150, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              onPressed: () {
                //passDatatoUser();
                click();
              },
              label: Text(
                "Sign-Up with Google",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              icon: Icon(
                Icons.security,
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
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              icon: Icon(
                Icons.phone,
                size: 30,
              ),
              backgroundColor: Colors.green[800],
            ),
            SizedBox(
              height: 170,
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(120, 850, 120, 10),
        child: Text(
          "Atom Creative Solutions",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
        ),
      )
    ]));
  }
}
