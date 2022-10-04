import 'package:flutter/material.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactiion = [
    Transaction(
        id: 't1', title: 'New Shows', amount: 2000, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New books', amount: 3000, date: DateTime.now()),
  ];

  void _addNewtransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactiion.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
            onTap: () {},
            child: NewTransactions(_addNewtransaction),
            behavior: HitTestBehavior.opaque);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Container(color: Colors.blue, child: Text('Chart!')),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransactiion),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
        
      ),
    );
  }
}
