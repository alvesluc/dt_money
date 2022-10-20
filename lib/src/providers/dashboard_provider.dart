import 'package:flutter/material.dart';

import '../features/home/models/dashboard_model.dart';
import '../features/home/models/transaction.dart';
import '../services/local_storage_service.dart';

class DashboardStore extends ValueNotifier<DashboardState> {
  DashboardStore(this._transactionsService) : super(InitialDashboardState());

  final DashboardService _transactionsService;

  double _totalIncome = 0;
  DateTime? _lastIncomeDate;

  double _totalExpenses = 0;
  DateTime? _lastExpenseDate;

  double _totalBalance = 0;
  DateTime? _firstEntryDate;
  DateTime? _lastEntryDate;

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
          _firstEntryDate,
          _lastEntryDate,
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
        _firstEntryDate,
        _lastEntryDate,
      ),
    );
  }

  void sortTransactionValue(TransactionModel transaction) {
    switch (transaction.type) {
      case TransactionType.income:
        _handleIncomeValues(transaction);
        break;
      case TransactionType.expense:
        _handleExpenseValues(transaction);
        break;
    }
    _totalBalance = _totalIncome - _totalExpenses;
    _firstEntryDate = _getFirstEntry(_firstEntryDate, transaction.entryDate);
    _lastEntryDate = _getLatestEntry(_lastIncomeDate, _lastExpenseDate);
  }

  void _handleIncomeValues(TransactionModel transaction) {
    _totalIncome += transaction.value;
    _lastIncomeDate = _getLatestEntry(_lastIncomeDate, transaction.entryDate);
  }

  void _handleExpenseValues(TransactionModel transaction) {
    _totalExpenses += transaction.value;
    _lastExpenseDate = _getLatestEntry(_lastExpenseDate, transaction.entryDate);
  }

  DateTime _getFirstEntry(DateTime? firstEntry, DateTime compareDate) {
    if (firstEntry == null) return compareDate;
    if (firstEntry.isBefore(compareDate)) return firstEntry;
    return compareDate;
  }

  DateTime? _getLatestEntry(
    DateTime? lastIncomeDate,
    DateTime? compareDate,
  ) {
    if (lastIncomeDate == null && compareDate == null) return null;
    if (compareDate == null) return null;
    if (lastIncomeDate == null) return compareDate;
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
