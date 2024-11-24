import 'package:flutter/material.dart';
import 'package:money_management/model/categorymodel.dart';
import 'package:money_management/model/transactionmodel.dart';
import 'package:money_management/services/categorydb.dart';
import 'package:money_management/services/transactiondb.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
  
    return ValueListenableBuilder(
        valueListenable: Categorydb().expensecate,
        builder: (BuildContext ctx, List<Transactionmodel> newList, Widget? _) {
          return ListView.builder(
              itemCount: newList.length,
              itemBuilder: (ctx, index) {
                final category = newList[index];
                return Card(
                  child: ListTile(
                    leading: Text(category.purpose),
                    trailing: IconButton(
                        onPressed: ()async {
                         await Transactiondb.instance
                              .deleteTransaction(category.id!);
                                Categorydb.instance.refreshUi();
                          //  Categorydb().deleteCategory(category.id);
                        },
                        icon: Icon(Icons.delete)),
                  ),
                );
              });
        });
  }
}
