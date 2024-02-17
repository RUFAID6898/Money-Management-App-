import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 2)
class Expense extends HiveObject {
  @HiveField(0)
  late double amount;

  @HiveField(1)
  late String type;

  @HiveField(2)
  late DateTime date;

  Expense({required this.amount, required this.type, required this.date});
}
