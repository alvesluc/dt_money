import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/models/transaction.dart';
import '../local_storage_service.dart';

class SharedPreferencesImpl implements LocalStorageService {
  @override
  Future<List<TransactionModel>> getTransactions() async {
    return _getStoredTransactions();
  }

  @override
  Future<void> addTransaction(TransactionModel newTransaction) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final transactions = await _getStoredTransactions();
    transactions.add(newTransaction);
    sharedPreferences.setString('transactions', _toJson(transactions));
  }

  @override
  Future<void> setTransactions(List<TransactionModel> transactions) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('transactions', _toJson(transactions));
  }

  Future<List<TransactionModel>> _getStoredTransactions() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storedTransactionsJson = sharedPreferences.getString('transactions');

    final transactions = <TransactionModel>[];

    if (storedTransactionsJson != null) {
      final storedTransactions = jsonDecode(storedTransactionsJson);
      for (var transactionJson in storedTransactions) {
        transactions.add(TransactionModel.fromJson(transactionJson));
      }
    }

    return transactions;
  }

  String _toJson(List<TransactionModel> transactions) {
    return jsonEncode(List.from(transactions.map((e) => e.toJson())));
  }
}
