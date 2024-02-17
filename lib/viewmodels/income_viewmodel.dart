import 'package:flutter/material.dart';
import 'package:money_management_app/models/income.dart';
import 'package:money_management_app/services/hive_service.dart';

class IncomeViewModel extends ChangeNotifier {
  final HiveService _hiveService;

  IncomeViewModel(this._hiveService);

  Future<void> addIncome(double amount, String type) async {
    final newIncome = Income(amount: amount, type: type);
    await _hiveService.addIncome(newIncome);
    notifyListeners();
  }

  Future<void> deleteIncome(int index) async {
    await _hiveService.deleteIncome(index);
    notifyListeners();
  }

  List<Income> get incomes => _hiveService.getIncomes();
}
