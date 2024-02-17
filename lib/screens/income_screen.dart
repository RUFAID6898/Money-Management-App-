import 'package:flutter/material.dart';
import 'package:money_management_app/viewmodels/income_viewmodel.dart';
import 'package:money_management_app/widgets/button_widgets.dart';
import 'package:provider/provider.dart';

class IncomeScreen extends StatelessWidget {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Income'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: typeController,
                  decoration: const InputDecoration(
                      labelText: 'Type', border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                      labelText: 'Amount', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    final type = typeController.text;
                    final amount = double.parse(amountController.text);
                    Provider.of<IncomeViewModel>(context, listen: false)
                        .addIncome(amount, type);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
