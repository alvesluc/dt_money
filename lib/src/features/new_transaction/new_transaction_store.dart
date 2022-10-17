import '../../services/local_storage_service.dart';
import '../home/models/transaction.dart';
import 'notifiers/transaction_type_notifier.dart';

class NewTransactionStore {
  final LocalStorageService _localStorage;

  NewTransactionStore(this._localStorage);

  final typeNotifier = TransactionTypeNotifier();
  String description = '';
  double value = 0;
  String category = '';

  void setDescription(String text) => description = text;
  void setValue(num text) => value = text as double;
  void setCategory(String text) => category = text;

  Future<void> addTransaction() async {
    final transaction = TransactionModel(
      description: description,
      value: value,
      category: category,
      type: TransactionType.values.byName(typeNotifier.value.name),
    );

    if (_isTransactionValid) {
      await _localStorage.addTransaction(transaction);
    }
  }

  bool get _isTransactionValid {
    return description.isNotEmpty && value > 0 && category.isNotEmpty;
  }
}
