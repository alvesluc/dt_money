import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';
import '../../../shared/extensions.dart';
import '../models/total_balance.dart';

class TotalBalanceCard extends StatelessWidget {
  const TotalBalanceCard({
    super.key,
    required this.totalBalance,
  });

  final TotalBalanceModel totalBalance;

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
        color: AppColors.greenDark,
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
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.gray6,
                  height: 1.6,
                ),
              ),
              Icon(
                PhosphorIcons.currencyDollar,
                color: AppColors.white,
                size: 32,
              )
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'R\$ ${totalBalance.value.toCurrency()}',
            style: const TextStyle(
              height: 1.4,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.gray7,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'De 15/03/22 até 13/04/22',
            style: TextStyle(
              color: AppColors.gray6,
            ),
          ),
        ],
      ),
    );
  }
}
