import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newtransaction extends StatefulWidget {
  final Function addts;

  Newtransaction(this.addts);

  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
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
