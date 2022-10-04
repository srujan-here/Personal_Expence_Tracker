import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addtx;

  NewTransactions(this.addtx);
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  void submitData() {
final enteredTitle=titlecontroller.text;
final eneteredAmount=double.parse(amountcontroller.text) ;

if(enteredTitle.isEmpty || eneteredAmount<=0){
  return ;

}

    addtx(
       enteredTitle,
       eneteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Tile'),
                controller: titlecontroller,
                onSubmitted: (_) => submitData,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData,
              ),
              ElevatedButton(
                  onPressed: () {
                    submitData();
                  },
                  child: Text('Add')),
            ]),
      ),
    );
  }
}
