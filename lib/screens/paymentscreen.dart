import 'package:flutter/material.dart';
import 'dart:math';
import 'package:upi_pay/upi_pay.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7A49E1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('UPI Payment options'),
        ),
        body: Screen(),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String _upiAddrError;

  final _upiAddressController = TextEditingController();
  final _amountController = TextEditingController();

  bool _isUpiEditable = false;
  Future<List<ApplicationMeta>> _appsFuture;

  @override
  void initState() {
    super.initState();
    _appsFuture = UpiPay.getInstalledUpiApplications();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _upiAddressController.dispose();
    super.dispose();
  }

  void _generateAmount() {
    setState(() {
      _amountController.text = "300";
    });
  }

  Future<void> _onTap(ApplicationMeta app) async {
    final err = _validateUpiAddress(_upiAddressController.text);
    if (err != null) {
      setState(() {
        _upiAddrError = err;
      });
      return;
    }
    setState(() {
      _upiAddrError = null;
    });

    final transactionRef = Random.secure().nextInt(1 << 32).toString();
    print("Starting transaction with id $transactionRef");

    final a = await UpiPay.initiateTransaction(
      amount: _amountController.text,
      app: app.upiApplication,
      receiverName: 'Harshil',
      receiverUpiAddress: _upiAddressController.text,
      transactionRef: transactionRef,
      merchantCode: '4444',
    );

    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _upiAddressController,
                    enabled: _isUpiEditable,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'address@upi',
                      labelText: 'Receiving UPI Address',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: Icon(
                      _isUpiEditable ? Icons.check : Icons.edit,
                    ),
                    onPressed: () {
                      setState(() {
                        _isUpiEditable = !_isUpiEditable;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_upiAddrError != null)
            Container(
              margin: EdgeInsets.only(top: 4, left: 12),
              child: Text(
                _upiAddrError,
                style: TextStyle(color: Colors.red),
              ),
            ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    readOnly: true,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: Icon(Icons.loop),
                    onPressed: _generateAmount,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 128, bottom: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Pay Using',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                FutureBuilder<List<ApplicationMeta>>(
                  future: _appsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container();
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1.6,
                      physics: NeverScrollableScrollPhysics(),
                      children: snapshot.data
                          .map((it) => Material(
                                key: ObjectKey(it.upiApplication),
                                color: Colors.grey[200],
                                child: InkWell(
                                  onTap: () => _onTap(it),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.memory(
                                        it.icon,
                                        width: 64,
                                        height: 64,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                        child: Text(
                                          it.upiApplication.getAppName(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

String _validateUpiAddress(String value) {
  if (value.isEmpty) {
    return 'UPI Address is required.';
  }

  if (!UpiPay.checkIfUpiAddressIsValid(value)) {
    return 'UPI Address is invalid.';
  }

  return null;
}
