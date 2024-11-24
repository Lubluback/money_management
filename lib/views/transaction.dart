import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_management/model/transactionmodel.dart';
import 'package:money_management/services/categorydb.dart';
import 'package:money_management/services/transactiondb.dart';
import 'package:money_management/widgets/floatingactionbutton.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    Transactiondb.instance.refreshUi();
    Categorydb.instance.refreshUi();
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      body: ValueListenableBuilder(
        valueListenable: Transactiondb.instance.transactionlistnotifier,
        builder: (BuildContext ctx, List<Transactionmodel> newlist, Widget? _) {
          if (MediaQuery.of(context).size.width > 900) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 1200 ? 5 : 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemCount: newlist.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.cyan.shade800,
                      )),
                      // color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Text(
                              parsedate(newlist[index].date),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.cyan.shade800,
                            radius: 50,
                          ),
                          Text(
                            newlist[index].purpose,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(" Rs ${newlist[index].amount}"),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Transactiondb.instance
                              .deleteTransaction(newlist[index].id!);
                        },
                        icon: const Icon(Icons.delete))
                  ],
                );
              },
            );
          } else {
            return ListView.builder(
                itemCount: newlist.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Slidable(
                    key: Key(newlist[index].id!),
                    startActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (ctx) {
                          Transactiondb.instance
                              .deleteTransaction(newlist[index].id!);
                        },
                        backgroundColor: Colors.cyan.shade800,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      // SlidableAction(
                      //   onPressed: (ctx) {},
                      //   backgroundColor: Color(0xFF21B7CA),
                      //   foregroundColor: Colors.white,
                      //   icon: Icons.share,
                      //   label: 'Share',
                      // ),
                    ]),
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.cyan.shade800,
                          radius: 50,
                          child: Text(
                            parsedate(newlist[index].date),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        title: Text(newlist[index].purpose),
                        subtitle: Text(" Rs ${newlist[index].amount}"),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }

  String parsedate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final splitdate = _date.split(' ');
    return '${splitdate.last}\n${splitdate.first}';

    // return '${date.day}\n${date.month}';
  }
}
