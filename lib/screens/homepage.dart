import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maintainance_tracker/screens/botscreen.dart';
import 'package:maintainance_tracker/screens/home.dart';
import 'package:maintainance_tracker/screens/transactions.dart';
import 'package:maintainance_tracker/screens/user.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int selectedpage = 0;
  List<Widget> tabs = <Widget>[
    HomePage(),
    Transactions(),
    Bot(),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: tabs.elementAt(selectedpage)),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepOrange,
          currentIndex: selectedpage,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                color: Colors.deepPurple,
              ),
              label: "Transactions",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assistant,
                color: Colors.deepPurple,
              ),
              label: "Karen",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              label: "Profile",
            )
          ],
          onTap: (int index) {
            setState(() {
              selectedpage = index;

              //print("$selectedpage");
            });
          }),
    );
  }
}
