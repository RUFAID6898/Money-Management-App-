import 'package:flutter/material.dart';
import 'package:money_management_app/viewmodels/expense_viewmodel.dart';
import 'package:provider/provider.dart';

class ExpenseScreen extends StatelessWidget {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Expense'),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                      labelText: 'Amount', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    final type = typeController.text;
                    final amount = double.parse(amountController.text);
                    final date = DateTime.now();
                    Provider.of<ExpenseViewModel>(context, listen: false)
                        .addExpense(amount, type, date);
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
