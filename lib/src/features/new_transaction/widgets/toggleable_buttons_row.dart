import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../notifiers/transaction_type_notifier.dart';
import 'toggleable_expense_button.dart';
import 'toggleable_income_button.dart';

class ToggleableButtonsRow extends StatelessWidget {
  const ToggleableButtonsRow({
    super.key,
    required this.transactionTypeNotifier,
    required this.setIncome,
    required this.setExpense,
  });

  final ValueListenable<ToggleableButtonsState> transactionTypeNotifier;
  final VoidCallback setIncome;
  final VoidCallback setExpense;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: transactionTypeNotifier,
      builder: (_, type, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ToggleableIncomeButton(
                isSelected: type == ToggleableButtonsState.income,
                onPressed: setIncome,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ToggleableExpenseButton(
                isSelected: type == ToggleableButtonsState.expense,
                onPressed: setExpense,
              ),
            ),
          ],
        );
      },
    );
  }
}
