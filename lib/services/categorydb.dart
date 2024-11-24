

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/model/categorymodel.dart';
import 'package:money_management/model/transactionmodel.dart';
import 'package:money_management/services/transactiondb.dart';

const category_Name = 'category database';

abstract class CategoryDbFunctions {
  Future<void> insertCategory(Categorymodel value);
  Future<List<Categorymodel>> getCategory();
  Future<void> deleteCategory(String categoryId);
}

class Categorydb implements CategoryDbFunctions {
  ValueNotifier<List<Transactionmodel>> incomecate = ValueNotifier([]);
  ValueNotifier<List<Transactionmodel>> expensecate = ValueNotifier([]);
  Categorydb._internal();
  static Categorydb instance = Categorydb._internal();
  factory Categorydb() {
    return instance;
  }

  @override
  Future<void> insertCategory(Categorymodel value) async {
    final databaseinsert = await Hive.openBox<Categorymodel>(category_Name);
    await databaseinsert.put(value.id, value);
    refreshUi();
  }

  @override
  Future<List<Categorymodel>> getCategory() async {
    final databaseget = await Hive.openBox<Categorymodel>(category_Name);
    return databaseget.values.toList();
  }

  Future<void> refreshUi() async {
    final categoryListed = await Transactiondb.instance.getTransaction();
    incomecate.value.clear();
    expensecate.value.clear();
    Future.forEach(
      categoryListed,
      (Transactionmodel transaction) {
        if (transaction.type == Category.income) {
          incomecate.value.add(transaction);
          print(incomecate.value);
        } else {
          expensecate.value.add(transaction);
        }
      },
    );
    incomecate.notifyListeners();
    expensecate.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    final category = await Hive.openBox<Categorymodel>(category_Name);
    await category.delete(categoryId);
    refreshUi();
  }
}
