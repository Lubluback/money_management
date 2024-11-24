import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_management/model/categorymodel.dart';
import 'package:money_management/model/transactionmodel.dart';
import 'package:money_management/services/categorydb.dart';
import 'package:money_management/services/transactiondb.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});
  static const routename = 'add_transaction';

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final purposeController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category? selectedtype;
  String? selectedId;
  // Categorymodel? selectedcategorymodel;
  @override
  void initState() {
    selectedtype = Category.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.cyan.shade800,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: purposeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Purpose',
                  ),
                ),
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Amount',
                  ),
                ),
                // if (selectedDate == null)
                Center(
                  child: TextButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(Duration(days: 30)),
                          lastDate: DateTime.now());
                      if (date == null) {
                        return;
                      } else {
                        print(date.toString());
                        selectedDate = date;

                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.cyan.shade800,
                    ),
                    label: Text(
                      selectedDate == null
                          ? "Select date"
                          : selectedDate.toString(),
                      style: TextStyle(color: Colors.cyan.shade800),
                    ),
                  ),
                ),
                // else

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        activeColor: Colors.cyan.shade800,
                        value: Category.income,
                        groupValue: selectedtype,
                        onChanged: (newvalue) {
                          selectedtype = Category.income;
                          selectedId = null;
                          setState(() {});
                        }),
                    Text("income"),
                    SizedBox(
                      width: 10,
                    ),
                    Radio(
                        activeColor: Colors.cyan.shade800,
                        value: Category.expense,
                        groupValue: selectedtype,
                        onChanged: (newvalue) {
                          selectedtype = Category.expense;
                          selectedId = null;
                          setState(() {});
                        }),
                    Text("Expense"),
                  ],
                ),
                // DropdownButton<String>(
                //     hint: Text("Select Category"),
                //     value: selectedId,
                //     items: (selectedtype == Category.income
                //             ? Categorydb().incomecate
                //             : Categorydb().expensecate)
                //         .value
                //         .map((e) {
                //       return DropdownMenuItem<String>(
                //           onTap: () {
                //             selectedcategorymodel = e;
                //           },
                //           value: e.id,
                //           child: Text(e.name));
                //     }).toList(),
                //     onChanged: (newval) {
                //       setState(() {
                //         selectedId = newval;
                //       });

                //   print(newval);
                // }),
                ElevatedButton(
                    onPressed: () {
                      addTransaction();
                      //    Transactiondb.instance.addTransaction();
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.cyan.shade800),
                    ))
              ],
            ),
          )),
    );
  }

  Future<void> addTransaction() async {
    final purposetext = purposeController.text;
    final amounttext = amountController.text;
    if (purposetext.isEmpty) {
      return;
    }
    if (amounttext.isEmpty) {
      return;
    }
    if (selectedDate == null) {
      return;
    }
    // if (selectedcategorymodel == null) {
    //   return;
    // }

    final amount = double.tryParse(amounttext);
    if (amount == null) {
      return;
    }
    final model = Transactionmodel(
        purpose: purposetext,
        amount: amount,
        date: selectedDate!,
        type: selectedtype!);
    await Transactiondb.instance.addTransaction(model);

    Navigator.of(context).pop();
    Transactiondb.instance.refreshUi();
  }
}
