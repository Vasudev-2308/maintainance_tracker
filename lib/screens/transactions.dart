import 'package:flutter/material.dart';
import 'package:maintainance_tracker/screens/edit.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
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
                          image: AssetImage('assets/wavy4.png'),
                          fit: BoxFit.cover)),
                  height: MediaQuery.of(context).size.height / 1.66,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 70, 0, 0),
                  child: Text(
                    "Transactions",
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
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              /*showModalBottomSheet(
                  isDismissible: true,
                  //isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: EditForm(),
                    );
                  });*/
              Navigator.of(context).pushNamed('/payment');
            },
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            label: Text("New Payment"),
            tooltip: "Add New Payment",
            backgroundColor: Colors.blue[600],
            splashColor: Colors.purple[800],
          ),
        ));
  }
}
