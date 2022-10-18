import 'package:flutter/material.dart';

import '../features/home/models/transaction.dart';
import '../services/local_storage_service.dart';

// class TransactionsProvider extends InheritedNotifier<TransactionsStore> {
//   const TransactionsProvider({
//     super.key,
//     required super.notifier,
//     required super.child,
//   });

//   static TransactionsStore of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<TransactionsProvider>()!.notifier!;
//   }
// }

class TransactionsStore extends ValueNotifier<TransactionsState> {
  TransactionsStore(this._transactionsService)
      : super(InitialTransactionsState());

  final TransactionsService _transactionsService;

  /// Used to refresh the screen without fetching extra times from local 
  /// storage.
  late List<TransactionModel> _localTransactions;

  Future<void> getTransactions() async {
    value = LoadingTransactionsState();
    try {
      final transactions = await _transactionsService.getTransactions();
      value = SuccessTransactionsState(transactions);
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
      value = SuccessTransactionsState(_localTransactions);
    } catch (e) {
      value = ErrorTransactionsState(e.toString());
    }
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

  SuccessTransactionsState(this.transactions);
}

class ErrorTransactionsState extends TransactionsState {
  final String message;

  ErrorTransactionsState(this.message);
}
