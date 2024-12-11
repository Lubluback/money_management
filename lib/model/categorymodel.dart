import 'package:hive/hive.dart';
part 'categorymodel.g.dart';

@HiveType(typeId: 2)
enum Category {
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class Categorymodel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeleted;

  @HiveField(3)
  final Category type;

  Categorymodel({
    required this.id,
    required this.type,
    required this.name,
    this.isDeleted = false,
  });
}
