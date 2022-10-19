import 'package:dt_money/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';

class TotalBalanceCard extends StatelessWidget {
  const TotalBalanceCard({
    super.key,
    required this.totalBalance,
    this.isMobile = true,
    this.firstEntry,
    this.lastEntry,
  });

  final double totalBalance;
  final DateTime? firstEntry;
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
        color: AppColors.greenDark,
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
                'Total',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  color: AppColors.gray6,
                  height: 1.6,
                ),
              ),
              const Icon(
                PhosphorIcons.currencyDollar,
                color: AppColors.white,
                size: 32,
              )
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'R\$ ${totalBalance.toCurrency()}',
            style: TextStyle(
              height: 1.4,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.gray7,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            firstEntry == null || lastEntry == null
                ? ''
                : 'De ${DateFormat('dd/MM/y').format(firstEntry!)} até ${DateFormat('dd/MM/y').format(lastEntry!)}',
            // lastEntry != null ? 'Última saída: ${ DateFormat('dd/MM/y').format(lastEntry!)}': '',
            style: const TextStyle(
              color: AppColors.gray6,
            ),
          ),
        ],
      ),
    );
  }
}
