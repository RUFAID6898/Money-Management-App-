import 'package:flutter/material.dart';
import 'package:money_management_app/screens/expense_screen.dart';
import 'package:money_management_app/screens/income_screen.dart';
import 'package:money_management_app/screens/overview_screen.dart';
import 'package:money_management_app/screens/settings_screen.dart';
import 'package:money_management_app/viewmodels/expense_viewmodel.dart';
import 'package:money_management_app/viewmodels/income_viewmodel.dart';
import 'package:money_management_app/widgets/button_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeViewModel = Provider.of<IncomeViewModel>(context);
    final expenseViewModel = Provider.of<ExpenseViewModel>(context);

    double totalIncome = incomeViewModel.incomes
        .map((income) => income.amount)
        .fold(0, (prev, amount) => prev + amount);

    double totalExpenses = expenseViewModel.expenses
        .map((expense) => expense.amount)
        .fold(0, (prev, amount) => prev + amount);

    double currentBalance = totalIncome - totalExpenses;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Money Management'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current Balance',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${currentBalance.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Income',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${totalIncome.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Expenses',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${totalExpenses.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidgets(
                  ButtonName: 'Add Income',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IncomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidgets(
                  ButtonName: 'Add Expense',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpenseScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidgets(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OverviewScreen(),
                        ),
                      );
                    },
                    ButtonName: 'Overview'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
