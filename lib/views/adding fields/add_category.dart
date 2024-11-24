// import 'package:flutter/material.dart';
// import 'package:money_management/model/categorymodel.dart';
// import 'package:money_management/services/categorydb.dart';

// ValueNotifier<Category> selectedCategory = ValueNotifier(Category.income);
// final nameController = TextEditingController();

// Future<void> popups(context) async {
//   showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           scrollable: true,
//           title: const Text(
//             "Add Category",
//             style: TextStyle(color: Colors.black),
//           ),
//           content: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       labelText: "Category Name",
//                       icon: Icon(
//                         Icons.category_rounded,
//                         color: Color.fromARGB(255, 26, 105, 114),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       RadioButton(title: 'income', type: Category.income),
//                       RadioButton(title: "expense", type: Category.expense),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             SizedBox(
//               //height: 100,
//               width: 300,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.white)),
//                 child: const Text(
//                   "Add",
//                   style: TextStyle(color: Color.fromARGB(255, 26, 105, 114)),
//                 ),
//                 onPressed: () {
//                   final name = nameController.text;
//                   if (name.isEmpty) {
//                     return;
//                   }

//                   final type = selectedCategory.value;
//                   final insertToDb = Categorymodel(
//                       id: DateTime.now().millisecondsSinceEpoch.toString(),
//                       type: type,
//                       name: name);
//                   Categorydb().insertCategory(insertToDb);
//                   Navigator.of(ctx).pop();
//                   print(name);
//                 },
//               ),
//             ),
//           ],
//         );
//       });
// }

// class RadioButton extends StatelessWidget {
//   const RadioButton({super.key, required this.title, required this.type});
//   final String title;
//   final Category type;

// //   @override
// //   State<RadioButton> createState() => _RadioButtonState();
// // }

// // class _RadioButtonState extends State<RadioButton> {
// //   Category? _type;
// //   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//       ValueListenableBuilder<Category>(
//           valueListenable: selectedCategory,
//           builder: (BuildContext ctx, Category typesc, Widget? _) {
//             return Radio<Category>(
//                 activeColor: Colors.cyan.shade800,
//                 value: type,
//                 groupValue: typesc,
//                 onChanged: (value) {
//                   if (value == null) {
//                     return;
//                   }

//                   selectedCategory.value = value;
//                   selectedCategory.notifyListeners();
//                 });
//           }),
//       Text(title),
//     ]);
//   }
// }
