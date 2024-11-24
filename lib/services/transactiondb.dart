import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/model/transactionmodel.dart';

const TRANSACTION_DB_NAME = "";

abstract class TransactiondbFunctions {
  Future<void> addTransaction(Transactionmodel value);
  Future<List<Transactionmodel>> getTransaction();
  Future<void> deleteTransaction(String id);
}

class Transactiondb implements TransactiondbFunctions {
  Transactiondb._internal();

  static Transactiondb instance = Transactiondb._internal();
  factory Transactiondb() {
    return instance;
  }
  
  ValueNotifier<List<Transactionmodel>> transactionlistnotifier =
      ValueNotifier([]);
  @override
  Future<void> addTransaction(Transactionmodel value) async {
    final db = await Hive.openBox<Transactionmodel>(TRANSACTION_DB_NAME);
    db.put(value.id, value);
  }

  Future<void> refreshUi() async {
    final list = await getTransaction();
    list.sort((first, second) => second.date!.compareTo(first.date!));
    transactionlistnotifier.value.clear();
    transactionlistnotifier.value.addAll(list);
    transactionlistnotifier.notifyListeners();
  }

  @override
  Future<List<Transactionmodel>> getTransaction() async {
    final dbget = await Hive.openBox<Transactionmodel>(TRANSACTION_DB_NAME);
    return dbget.values.toList();
  }

  @override
  Future<void> deleteTransaction(id) async {
    final dbdlt = await Hive.openBox<Transactionmodel>(TRANSACTION_DB_NAME);
    await dbdlt.delete(id);
    refreshUi();
  }
}
