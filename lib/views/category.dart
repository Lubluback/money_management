import 'package:flutter/material.dart';
import 'package:money_management/services/categorydb.dart';
import 'package:money_management/views/expense.dart';
import 'package:money_management/views/income.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    Categorydb().refreshUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TabBar(
          indicatorWeight: 2.7,
          indicatorColor: Colors.cyan.shade800,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerHeight: 1,
          controller: tabController,
          labelColor: Colors.black,
          tabs: [
            Tab(
              text: "Income",
            ),
            Tab(
              text: "Expense",
            ),
          ],
        ),
        Expanded(
            child: TabBarView(
                controller: tabController, children: [Income(), Expense()]))
      ],
    ));
  }
}
