import 'package:hive/hive.dart';
import 'package:money_management/model/categorymodel.dart';

part 'transactionmodel.g.dart';

@HiveType(typeId: 3)
class Transactionmodel {
  @HiveField(0)
  final String purpose;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final Category type;

  // @HiveField(4)
  // final Categorymodel selectcat;

  @HiveField(5)
  String? id;

  Transactionmodel({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
  }) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
