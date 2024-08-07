import 'package:coffee_card/helper/helper_functions.dart';
import 'package:coffee_card/models/expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void openNewExpenseBox() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("New expense"),
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Name"),
            ),

            TextField(
              controller: amountController,
            ),
          ]
        ),
        actions: [
          // cancel button
          _cancelButton()

          // save button
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openNewExpenseBox,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _cancelButton() {
    return MaterialButton(onPressed: () {
        // pop box
        Navigator.pop(context);

        // clear controllers
        nameController.clear();
        amountController.clear();
      },
      child: const Text('Cancel'),
    );
  }

  Widget _createNewExpenseButton() {
    return MaterialButton(onPressed: () {
        if (nameController.text.isNotEmpty && amountController.text.isNotEmpty) {
          Navigator.pop(context);

          Expense newExpense = Expense(
            name: nameController.text,
            amount: convertStringToDouble(amountController.text),
            date: DateTime.now()
          );
        }
      },
      child: const Text('Cancel'),
    );
  }
}