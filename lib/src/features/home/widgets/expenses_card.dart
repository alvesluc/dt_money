import 'package:dt_money/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({
    super.key,
    required this.totalExpenses,
    this.isMobile = true,
    this.lastEntry,
  });

  final double totalExpenses;
  final DateTime? lastEntry;
  final bool isMobile;

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
            children: [
              Text(
                'Saídas',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  color: AppColors.gray6,
                  height: 1.6,
                ),
              ),
              const Icon(
                PhosphorIcons.arrowCircleDown,
                color: AppColors.red,
                size: 32,
              )
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'R\$ ${totalExpenses.toCurrency()}',
            style: TextStyle(
              height: 1.4,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.gray7,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            lastEntry != null ? 'Última saída: ${ DateFormat('dd/MM/y').format(lastEntry!)}': '',
            style: const TextStyle(
              color: AppColors.gray5,
            ),
          ),
        ],
      ),
    );
  }
}
