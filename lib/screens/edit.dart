import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditForm extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Icon(
                  Icons.drag_handle_sharp,
                  size: 50,
                  color: Colors.purple,
                )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidate: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter amount to be Paid';
                    }
                    return null;
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.money),
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Colors.purple)),
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      hintText: "Enter amount"),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.maxFinite,
                    height: 50.0,
                    child: RaisedButton.icon(
                        color: Colors.purple,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Kindly Enter Valid amount",
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Continue Payment",
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            )));
  }
}
