import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management_app/models/expense.dart';
import 'package:money_management_app/models/income.dart';
import 'package:money_management_app/screens/home_screen.dart';
import 'package:money_management_app/services/hive_service.dart';
import 'package:money_management_app/viewmodels/expense_viewmodel.dart';
import 'package:money_management_app/viewmodels/income_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(IncomeAdapter().typeId)) {
    Hive.registerAdapter(IncomeAdapter());
  }
  if (!Hive.isAdapterRegistered(ExpenseAdapter().typeId)) {
    Hive.registerAdapter(ExpenseAdapter());
  }

  await Hive.openBox<Income>(HiveService.incomeBoxName);
  await Hive.openBox<Expense>(HiveService.expenseBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IncomeViewModel(HiveService()),
        ),
        ChangeNotifierProvider(
          create: (context) => ExpenseViewModel(HiveService()),
        ),
      ],
      child: MaterialApp(
        title: 'Money Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
