import 'package:hive/hive.dart';

part 'income.g.dart';

@HiveType(typeId: 0)
class Income extends HiveObject {
  @HiveField(0)
  late double amount;

  @HiveField(1)
  late String type;

  Income({required this.amount, required this.type});
}
