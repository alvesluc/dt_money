import 'package:flutter/material.dart';

import '../../../shared/extensions.dart';
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

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isDesktop) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transaction(transaction: incomeTransaction, isMobile: false),
            const SizedBox(height: 12),
            Transaction(transaction: expenseTransaction, isMobile: false),
            const SizedBox(height: 12),
          ],
        );
      }
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
