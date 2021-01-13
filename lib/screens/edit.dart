import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<EditForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        TextFormField(
          initialValue: "Owner Name",
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          initialValue: "F-3",
        ),
        SizedBox(
          height: 20,
        ),
        DropdownButton(
            items: [],
            onChanged: null,
            icon: Icon(
              Icons.payment,
              color: Colors.greenAccent,
            )),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            color: Colors.white,
          ),
          label: Text(
            "Pay",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
        )
      ],
    ));
  }
}
