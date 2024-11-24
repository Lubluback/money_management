import 'package:flutter/material.dart';

import 'package:money_management/views/adding%20fields/add_category.dart';
import 'package:money_management/views/adding%20fields/add_transaction.dart';
import 'package:money_management/views/homepage.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FittedBox(
        child: FloatingActionButton.large(
          tooltip: "Settings",
          backgroundColor: Colors.cyan.shade800,
          foregroundColor: Colors.white,
          // elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            if (HomePage.selectedindex.value == 0) {
              print("transaction");
              Navigator.of(context).pushNamed(AddTransaction.routename);
            } else {
              print("category");
           //   popups(context);
            }
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
