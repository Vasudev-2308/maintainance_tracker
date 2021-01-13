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
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Transactions"),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                  size: 40,
                )
              ],
            )),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet(
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
                  });
            },
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            label: Text("New Payment"),
            tooltip: "Add New Payment",
            backgroundColor: Colors.blue,
            splashColor: Colors.purple[800],
          ),
        ));
  }
}
