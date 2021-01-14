import 'package:flutter/material.dart';

class Bot extends StatefulWidget {
  @override
  _BotState createState() => _BotState();
}

class _BotState extends State<Bot> {
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
          body: Stack(children: <Widget>[
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
                "Karen-Bot",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ]),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: Text("Say HI"),
            icon: Icon(Icons.chat_bubble_outline_outlined),
            backgroundColor: Colors.blue[600],
          ),
        ));
  }
}
