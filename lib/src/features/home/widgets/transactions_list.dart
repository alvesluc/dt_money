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
      value: 12000,
      category: 'Venda',
      type: TransactionType.income,
    );

    final expenseTransaction = TransactionModel(
      description: 'Aluguel',
      value: 2000,
      category: 'Casa',
      type: TransactionType.expense,
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isDesktop) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1168),
            child: Column(
              children: [
                Transaction(transaction: incomeTransaction, isMobile: false),
                const SizedBox(height: 8),
                Transaction(transaction: expenseTransaction, isMobile: false),
              ],
            ),
          ),
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
