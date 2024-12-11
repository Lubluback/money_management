import 'package:flutter/material.dart';

import 'package:money_management/model/transactionmodel.dart';
import 'package:money_management/services/categorydb.dart';
import 'package:money_management/services/transactiondb.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Categorydb().incomecate,
        builder: (BuildContext ctx, List<Transactionmodel> newList, Widget? _) {
          return ListView.builder(
              itemCount: newList.length,
              itemBuilder: (ctx, index) {
                final category = newList[index];
                return Card(
                  child: ListTile(
                    leading: Text(category.purpose),
                    trailing: IconButton(
                        onPressed: () async {
                          await Transactiondb.instance
                              .deleteTransaction(category.id!);
                          Categorydb.instance.refreshUi();
                          //   Categorydb().deleteCategory(category.id);
                        },
                        icon: const Icon(Icons.delete)),
                  ),
                );
              });
        });
  }
}
