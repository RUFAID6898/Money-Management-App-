import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_management_app/models/expense.dart';
import 'package:money_management_app/models/income.dart';
import 'package:money_management_app/viewmodels/income_viewmodel.dart';
import 'package:money_management_app/viewmodels/expense_viewmodel.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeViewModel = Provider.of<IncomeViewModel>(context);
    final expenseViewModel = Provider.of<ExpenseViewModel>(context);

    List<Income> incomes = incomeViewModel.incomes;
    List<Expense> expenses = expenseViewModel.expenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            _buildBreakdown(incomes, expenses),
            const SizedBox(height: 20),
            _buildDateFilter(),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakdown(List<Income> incomes, List<Expense> expenses) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Breakdown',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildDateFilter() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter by Date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
