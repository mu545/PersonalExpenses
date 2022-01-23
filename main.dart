import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:untitled8/untitled8.dart';
import 'package:untitled8_example/widgets/Newtransaction.dart';
import 'package:untitled8_example/widgets/transaction_list.dart';

import 'models/transaction.dart';
//import 'package:untitled8_example/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  String titleinput;
  String amountinput;
  final List<Transaction> _usertransaction = [];

  void _add(String txtitle, double txamount) {
    final newtx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _usertransaction.add(newtx);
    });
  }

  // void _showadd(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Newtransaction(_add);
  //     },
  //   );
  // }

  final List<Transaction> transactions = [];

  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(appBar: AppBar(title: Text(''),),));
  }
}

class Newtransaction extends StatefulWidget {
  final Function addts;

  Newtransaction(this.addts);

  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final List<Transaction> _usertransaction = [
    Transaction(
      title: '',
      amount: 1,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    )
  ];

  final titlecon = TextEditingController();

  final amountcon = TextEditingController();

  void Sub() {
    final titlenter = titlecon.text;
    final amountenter = double.parse(amountcon.text);
    if (titlenter.isEmpty || amountenter <= 0) {
      return;
    }
    widget.addts(titlenter, amountenter);
  }

  Widget build(BuildContext b) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecon,
              onSubmitted: (_) => Sub(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcon,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => Sub(),
            ),
            FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.red,
                onPressed: () {
                  Sub();
                })
          ],
        ),
      ),
    );
  }
}

// Scaffold(
// appBar: AppBar(
// backgroundColor: Colors.purple,
// title: Text('Personal expenses '),
// actions: <Widget>[
// IconButton(
// icon: Icon(Icons.add),
// onPressed: () => _showadd(context),
// ),
// ]),
// body: SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// Container(
// width: double.infinity,
// child: Card(
// // child: Text("Muhammed "),
// // color: Colors.blue,
// ),
// ),
// TransactionList(_usertransaction)
// ],
// )),
// floatingActionButtonLocation:
// FloatingActionButtonLocation.centerFloat,
// floatingActionButton: FloatingActionButton(
// backgroundColor: Colors.orangeAccent,
// child: Icon(
// Icons.add,
// color: Colors.purpleAccent,
// ),
// onPressed: () => _showadd(context),
// )),
