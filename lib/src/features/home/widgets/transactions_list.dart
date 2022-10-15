import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeTransaction = TransactionModel(
      description: 'Desenvolvimento de aplicativo',
      price: 12000,
      tag: 'Venda',
      type: TransactionType.income,
    );

    final expenseTransaction = TransactionModel(
      description: 'Aluguel',
      price: 2000,
      tag: 'Casa',
      type: TransactionType.expense,
    );

    return Builder(builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transaction(transaction: incomeTransaction),
          const SizedBox(height: 12),
          Transaction(transaction: expenseTransaction),
          const SizedBox(height: 12),
        ],
      );
    });
  }
}
