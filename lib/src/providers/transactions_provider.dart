import 'package:flutter/material.dart';

import '../features/home/models/transaction.dart';
import '../services/local_storage_service.dart';

class TransactionsStore extends ValueNotifier<TransactionsState> {
  TransactionsStore(this._transactionsService) : super(InitialTransactionsState());

  final TransactionsService _transactionsService;

  late List<TransactionModel> _localTransactions;

  final queriedTransactions = <TransactionModel>[];

  Future<void> getTransactions() async {
    value = LoadingTransactionsState();
    try {
      final transactions = await _transactionsService.getTransactions();
      value = SuccessTransactionsState(transactions, queriedTransactions);
      _localTransactions = transactions;
    } catch (e) {
      value = ErrorTransactionsState(e.toString());
    }
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    value = LoadingTransactionsState();
    try {
      await _transactionsService.addTransaction(transaction);
      _localTransactions.add(transaction);
      value = SuccessTransactionsState(_localTransactions, queriedTransactions);
    } catch (e) {
      value = ErrorTransactionsState(e.toString());
    }
  }

  void searchTransaction(String query) {
    queriedTransactions.clear();
    for (var transaction in _localTransactions) {
      if (transaction.toQuery().contains(query.toLowerCase())) {
        queriedTransactions.add(transaction);
      }
    }
    value = SuccessTransactionsState(_localTransactions, queriedTransactions);
  }
}

class TransactionsService {
  TransactionsService(this._localStorage);

  final LocalStorageService _localStorage;

  Future<List<TransactionModel>> getTransactions() async {
    return _localStorage.getTransactions();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    if (_isTransactionValid(transaction)) {
      await _localStorage.addTransaction(transaction);
    }
  }

  bool _isTransactionValid(TransactionModel transaction) {
    return transaction.description.isNotEmpty &&
        transaction.value > 0 &&
        transaction.category.isNotEmpty;
  }
}

abstract class TransactionsState {}

class InitialTransactionsState extends TransactionsState {}

class LoadingTransactionsState extends TransactionsState {}

class SuccessTransactionsState extends TransactionsState {
  final List<TransactionModel> transactions;
  final List<TransactionModel> queriedTransactions;

  SuccessTransactionsState(this.transactions, this.queriedTransactions);
}

class ErrorTransactionsState extends TransactionsState {
  final String message;

  ErrorTransactionsState(this.message);
}
