import 'package:dt_money/src/services/local_storage_service.dart';

import 'models/transaction.dart';

class NewTransactionController {
  final LocalStorageService _localStorage;

  NewTransactionController(this._localStorage);

  Future<void> newTransaction(TransactionModel transaction) async {
    if (_isTransactionValid(transaction)) {
      await _localStorage.addTransaction(transaction);
    }
  }

  bool _isTransactionValid(TransactionModel transaction) {
    return transaction.description.isNotEmpty &&
        transaction.category.isNotEmpty &&
        transaction.value > 0;
  }
}
