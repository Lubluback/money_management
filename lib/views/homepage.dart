import 'package:flutter/material.dart';
import 'package:money_management/views/category.dart';
import 'package:money_management/views/transaction.dart';
import 'package:money_management/widgets/bottamnavigationbar.dart';
import 'package:money_management/widgets/floatingactionbutton.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List options = [
    const Transaction(),
    const Category(),
  ];
  static ValueNotifier<int> selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: const NavBar(),
         
          appBar: AppBar(
            title: const Center(
              child: Text(
                "My Money",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.cyan.shade800,
          ),
          body: ValueListenableBuilder(
              valueListenable: selectedindex,
              builder: (BuildContext ctx, int updatedindex, Widget? _) {
                return options[updatedindex];
              })),
    );
  }
}
