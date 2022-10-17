import 'package:dt_money/src/features/home/models/transaction.dart';

abstract class LocalStorageService {
  Future<void> addTransaction(TransactionModel transaction);
  Future<void> setTransactions(List<TransactionModel> transaction);
  Future<List<TransactionModel>> getTransactions();
}