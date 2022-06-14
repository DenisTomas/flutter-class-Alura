
import 'package:continuacao_bytebank_app/components/editor.dart';
import 'package:continuacao_bytebank_app/main.dart';
import 'package:continuacao_bytebank_app/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerFieldAccountNumber =
  TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  static const _appBarTitle = "Generating Transfers";
  static const _labelFieldValue = "Value";
  static const _hintField = "0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controller: _controllerFieldAccountNumber,
                hint: "0000",
                label: "Account number",
                icon: Icons.numbers_sharp,
              ),
              Editor(
                controller: _controllerFieldValue,
                hint: _hintField,
                label: _labelFieldValue,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => _generateTransfer(context),
                child: const Text("Confirm"),
              )
            ],
          ),
        ));
  }

  void _generateTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double? value = double.tryParse(_controllerFieldValue.text);
    if (accountNumber != null && value != null) {
      final generatedTransfer = Transfers(value, accountNumber);
      Navigator.pop(context, generatedTransfer);
    }
  }
}
