//

import 'package:flutter/material.dart';
import 'package:money_management_app/models/expense.dart';
import 'package:money_management_app/services/hive_service.dart';

class ExpenseViewModel extends ChangeNotifier {
  final HiveService _hiveService;

  ExpenseViewModel(this._hiveService);

  Future<void> addExpense(double amount, String type, DateTime date) async {
    final newExpense = Expense(amount: amount, type: type, date: date);
    await _hiveService.addExpense(newExpense);
    notifyListeners();
  }

  Future<void> deleteExpense(int index) async {
    await _hiveService.deleteExpense(index);
    notifyListeners();
  }

  List<Expense> get expenses => _hiveService.getExpenses();
}
