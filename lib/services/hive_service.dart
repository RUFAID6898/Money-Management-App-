// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

// class HiveService {
//   late Box _incomeBox;
//   late Box _expenseBox;

//   Future<void> init() async {
//     final appDocumentDir =
//         await path_provider.getApplicationDocumentsDirectory();
//     Hive.init(appDocumentDir.path);
//     _incomeBox = await Hive.openBox('incomes');
//     _expenseBox = await Hive.openBox('expenses');
//   }

//   Box get incomeBox => _incomeBox;

//   Box get expenseBox => _expenseBox;
// }

// // services/hive_service.dart
// import 'package:hive/hive.dart';

// class HiveService {
//   static Future<void> initHive() async {
//     await Hive.initFlutter();
//     // Register your models here
//     Hive.registerAdapter(IncomeAdapter());
//     Hive.registerAdapter(ExpenseAdapter());
//   }

//   static Future<Box<dynamic>> openBox(String name) async {
//     return await Hive.openBox(name);
//   }
// }
// services/hive_service.dart

import 'package:hive/hive.dart';
import 'package:money_management_app/models/expense.dart';
import 'package:money_management_app/models/income.dart';

class HiveService {
  static const String incomeBoxName = 'incomeBox';
  static const String expenseBoxName = 'expenseBox';

  Future<void> addIncome(Income income) async {
    final box = await Hive.openBox<Income>(incomeBoxName);
    await box.add(income);
  }

  Future<void> addExpense(Expense expense) async {
    final box = await Hive.openBox<Expense>(expenseBoxName);
    await box.add(expense);
  }

  List<Income> getIncomes() {
    final box = Hive.box<Income>(incomeBoxName);
    return box.values.toList();
  }

  List<Expense> getExpenses() {
    final box = Hive.box<Expense>(expenseBoxName);
    return box.values.toList();
  }

  Future<void> deleteIncome(int index) async {
    final box = await Hive.openBox<Income>(incomeBoxName);
    await box.deleteAt(index);
  }

  Future<void> deleteExpense(int index) async {
    final box = await Hive.openBox<Expense>(expenseBoxName);
    await box.deleteAt(index);
  }
}
