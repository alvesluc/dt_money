import 'package:dt_money/src/shared/extensions.dart';
import 'package:flutter/material.dart';

import '../models/total_balance.dart';
import '../models/total_expenses.dart';
import '../models/total_income.dart';
import 'expenses_card.dart';
import 'income_card.dart';
import 'total_balance_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.totalIncome,
    required this.totalExpenses,
    required this.totalBalance,
  });

  final TotalIncomeModel totalIncome;
  final TotalExpensesModel totalExpenses;
  final TotalBalanceModel totalBalance;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 920) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              transform: Matrix4.translationValues(0.0, -48.0, 0.0),
              width: 1120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: IncomeCard(
                      totalIncome: totalIncome,
                      isMobile: false,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: ExpensesCard(
                      totalExpenses: totalExpenses,
                      isMobile: false,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: TotalBalanceCard(
                      totalBalance: totalBalance,
                      isMobile: false,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container(
          height: 150,
          transform: Matrix4.translationValues(0.0, -48.0, 0.0),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            children: [
              IncomeCard(totalIncome: totalIncome),
              const SizedBox(width: 16),
              ExpensesCard(totalExpenses: totalExpenses),
              const SizedBox(width: 16),
              TotalBalanceCard(totalBalance: totalBalance),
            ],
          ),
        );
      },
    );
  }
}
