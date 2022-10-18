import 'notifiers/transaction_type_notifier.dart';

class NewTransactionStore {
  final typeNotifier = TransactionTypeNotifier();
  String description = '';
  double value = 0;
  String category = '';

  void setDescription(String text) => description = text;
  void setValue(num text) => value = text as double;
  void setCategory(String text) => category = text;
}
