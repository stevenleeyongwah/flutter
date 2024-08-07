import 'package:coffee_card/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ExpenseDatabase extends ChangeNotifier {
  static late Isar isar;
  List<Expense> _allExpenses = [];

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ExpenseSchema], directory: dir.path);
  }

  // Getters
  List<Expense> get allExpense => _allExpenses;

  // Operations
  Future<void> createNewExpense(Expense newExpense) async {
    await isar.writeTxn(() => isar.expenses.put(newExpense));

    // readExpenses();
  }

  // Future<void> readExpenses() async {
  //   List<Expense> fetchedExpenses = isar.expenses.where().findAll();

  //   _allExpenses.clear();
  //   _allExpenses.addAll(fetchedExpenses);

  //   notifyListeners();
  // }

  Future<void> updateExpense(int id, Expense updatedExpense) async {
    updatedExpense.id = id;

    await isar.writeTxn(() => isar.expenses.put(updatedExpense));
  }

  Future<void> deleteExpense(int id) async {
    await isar.writeTxn(() => isar.expenses.delete(id));

    // await readExpenses();
  }
}