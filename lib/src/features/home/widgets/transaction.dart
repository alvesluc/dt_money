import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';
import '../../../shared/extensions.dart';
import '../models/transaction.dart';

class Transaction extends StatelessWidget {
  const Transaction({
    super.key,
    required this.transaction,
    this.isMobile = true,
  });

  final TransactionModel transaction;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: isMobile
            ? const EdgeInsets.all(20)
            : const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        decoration: BoxDecoration(
          color: AppColors.gray3,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Builder(
          builder: (context) {
            if (isMobile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.description,
                    style: const TextStyle(
                      color: AppColors.gray6,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  Builder(builder: (_) {
                    switch (transaction.type) {
                      case TransactionType.income:
                        return Text(
                          'R\$ ${transaction.value.toCurrency()}',
                          style: const TextStyle(
                            color: AppColors.greenLight,
                            fontSize: 20,
                            height: 1.6,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      case TransactionType.expense:
                        return Text(
                          '- R\$ ${transaction.value.toCurrency()}',
                          style: const TextStyle(
                            color: AppColors.red,
                            fontSize: 20,
                            height: 1.6,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                    }
                  }),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            PhosphorIcons.tagSimple,
                            color: AppColors.gray5,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            transaction.category,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.gray5,
                              height: 1.6,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            PhosphorIcons.calendarBlank,
                            color: AppColors.gray5,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '15/10/2022',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.gray5,
                              height: 1.6,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              );
            }
            return Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: FixedColumnWidth(200),
                2: FixedColumnWidth(240),
                3: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Text(
                      transaction.description,
                      style: const TextStyle(
                        color: AppColors.gray6,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    Builder(builder: (_) {
                      switch (transaction.type) {
                        case TransactionType.income:
                          return Text(
                            'R\$ ${transaction.value.toCurrency()}',
                            style: const TextStyle(
                              color: AppColors.greenLight,
                              fontSize: 16,
                              height: 1.6,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          );
                        case TransactionType.expense:
                          return Text(
                            '- R\$ ${transaction.value.toCurrency()}',
                            style: const TextStyle(
                              color: AppColors.red,
                              fontSize: 16,
                              height: 1.6,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          );
                      }
                    }),
                    Row(
                      children: const [
                        Icon(
                          PhosphorIcons.tagSimple,
                          color: AppColors.gray5,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Venda',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.gray5,
                            height: 1.6,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          PhosphorIcons.calendarBlank,
                          color: AppColors.gray5,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '15/10/2022',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.gray5,
                            height: 1.6,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
