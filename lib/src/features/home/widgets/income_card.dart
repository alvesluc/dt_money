import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';
import '../../../shared/extensions.dart';
import '../models/total_income.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({
    super.key,
    required this.totalIncome,
    this.isMobile = true,
  });

  final TotalIncomeModel totalIncome;
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
                'Entradas',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  color: AppColors.gray6,
                  height: 1.6,
                ),
              ),
              const Icon(
                PhosphorIcons.arrowCircleUp,
                color: AppColors.greenLight,
                size: 32,
              )
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'R\$ ${totalIncome.value.toCurrency()}',
            style: TextStyle(
              height: 1.4,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.gray7,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Última entrada em 15 de outubro',
            style: TextStyle(
              color: AppColors.gray5,
            ),
          ),
        ],
      ),
    );
  }
}
