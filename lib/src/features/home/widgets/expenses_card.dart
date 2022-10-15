import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';
import '../../../shared/extensions.dart';
import '../models/total_expenses.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({
    super.key,
    required this.totalExpenses,
  });

  final TotalExpensesModel totalExpenses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 32,
        top: 24,
        right: 24,
        bottom: 24,
      ),
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Saídas',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.gray6,
                  height: 1.6,
                ),
              ),
              Icon(
                PhosphorIcons.arrowCircleDown,
                color: AppColors.red,
                size: 32,
              )
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'R\$ ${totalExpenses.value.toCurrency()}',
            style: const TextStyle(
              height: 1.4,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.gray7,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Última entrada em 10 de abril',
            style: TextStyle(
              color: AppColors.gray5,
            ),
          ),
        ],
      ),
    );
  }
}
