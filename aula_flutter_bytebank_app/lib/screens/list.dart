import 'package:continuacao_bytebank_app/models/transfer.dart';
import 'package:continuacao_bytebank_app/screens/form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  final List<Transfers> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfers"),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfers = widget._transfers[index];
          return TransferItens(transfers);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfers?> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((ReceivedTransfer) {
            Future.delayed(Duration(seconds: 1), () {
              if (ReceivedTransfer != null) {
                setState(() {
                  widget._transfers.add(ReceivedTransfer);
                });
              }
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TransferItens extends StatelessWidget {
  final Transfers _transfers;

  TransferItens(this._transfers);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: const Icon(Icons.monetization_on),
          title: Text(_transfers.value.toString()),
          subtitle: Text(_transfers.accountNumber.toString()),
        ));
  }
}
