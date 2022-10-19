import 'package:flutter/material.dart';

import '../features/home/models/dasboard_model.dart';
import '../features/home/models/transaction.dart';
import '../services/local_storage_service.dart';

class DashboardStore extends ValueNotifier<DashboardState> {
  DashboardStore(this._transactionsService) : super(InitialDashboardState());

  final DashboardService _transactionsService;

  double _totalIncome = 0;
  DateTime _lastIncomeDate = DateTime.now();

  double _totalExpenses = 0;
  DateTime _lastExpenseDate = DateTime.now();

  double _totalBalance = 0;
  DateTime _firstEntry = DateTime.now();
  DateTime _lastEntry = DateTime.now();

  Future<void> getDashboard() async {
    value = LoadingDashboardState();
    try {
      final transactions = await _transactionsService.getTransactions();

      for (var transaction in transactions) {
        sortTransactionValue(transaction);
      }

      value = SuccessDashboardState(
        DashboardModel(
          _totalIncome,
          _lastIncomeDate,
          _totalExpenses,
          _lastExpenseDate,
          _totalBalance,
          _firstEntry,
          _lastEntry,
        ),
      );
    } catch (e) {
      value = ErrorDashboardState(e.toString());
    }
  }

  Future<void> updateDashboard(TransactionModel transaction) async {
    sortTransactionValue(transaction);

    value = SuccessDashboardState(
      DashboardModel(
        _totalIncome,
        _lastIncomeDate,
        _totalExpenses,
        _lastExpenseDate,
        _totalBalance,
        _firstEntry,
        _lastEntry,
      ),
    );
  }

  void sortTransactionValue(TransactionModel transaction) {
    switch (transaction.type) {
      case TransactionType.income:
        _totalIncome += transaction.value;
        _lastIncomeDate = _getLatestEntryDate(
          _lastIncomeDate,
          transaction.entryDate,
        );
        break;
      case TransactionType.expense:
        _totalExpenses += transaction.value;
        _lastExpenseDate = _getLatestEntryDate(
          _lastExpenseDate,
          transaction.entryDate,
        );
        break;
    }
    _totalBalance = _totalIncome - _totalExpenses;
    _firstEntry = _getFirstEntry(_firstEntry, transaction.entryDate);
    _lastEntry = _getLatestEntryDate(_lastIncomeDate, _lastExpenseDate);
  }

  DateTime _getFirstEntry(DateTime firstEntry, DateTime compareDate) {
    if (firstEntry.isBefore(compareDate)) return firstEntry;
    return compareDate;
  }

  DateTime _getLatestEntryDate(DateTime lastIncomeDate, DateTime compareDate) {
    if (lastIncomeDate.isAfter(compareDate)) return lastIncomeDate;
    return compareDate;
  }
}

class DashboardService {
  DashboardService(this._localStorage);

  final LocalStorageService _localStorage;

  Future<List<TransactionModel>> getTransactions() async {
    return _localStorage.getTransactions();
  }
}

abstract class DashboardState {}

class InitialDashboardState extends DashboardState {}

class LoadingDashboardState extends DashboardState {}

class SuccessDashboardState extends DashboardState {
  final DashboardModel dashboard;

  SuccessDashboardState(this.dashboard);
}

class ErrorDashboardState extends DashboardState {
  final String message;

  ErrorDashboardState(this.message);
}
