import 'package:dt_money/src/features/home/models/transaction.dart';
import 'package:dt_money/src/features/home/new_transaction_controller.dart';
import 'package:dt_money/src/services/shared_preferences_service/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NewTransactionController controller;
  late TransactionModel incomeTransaction;
  late TransactionModel expenseTransaction;
  late TransactionModel invalidTransaction;

  setUp(() {
    controller = NewTransactionController(SharedPreferencesImpl());
    incomeTransaction = TransactionModel(
      description: 'Desenvolvimento de aplicativo',
      value: 12000.0,
      category: 'Venda',
      type: TransactionType.income,
    );
    expenseTransaction = TransactionModel(
      description: 'Desenvolvimento de aplicativo',
      value: 12000.0,
      category: 'Venda',
      type: TransactionType.expense,
    );
    invalidTransaction = TransactionModel(
      description: '',
      value: 0,
      category: '',
      type: TransactionType.expense,
    );
  });

  group('NewTransactionController', () {
    group('newTransaction', () {
      test('should create a new income transaction', () {
        controller.newTransaction(incomeTransaction);

        expect(controller.transactions.contains(incomeTransaction), true);
        expect(controller.transactions.last.type, TransactionType.income);
      });

      test('should create a new expense transaction', () {
        controller.newTransaction(expenseTransaction);

        expect(controller.transactions.contains(expenseTransaction), true);
        expect(controller.transactions.last.type, TransactionType.expense);
      });

      test('should not create a transaction if value is 0', () {
        controller.newTransaction(invalidTransaction);

        expect(controller.transactions.contains(invalidTransaction), false);
      });
    });
  });
}
