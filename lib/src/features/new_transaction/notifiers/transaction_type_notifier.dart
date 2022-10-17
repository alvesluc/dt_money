import 'package:flutter/material.dart';

class TransactionTypeNotifier extends ValueNotifier<ToggleableButtonsState> {
  TransactionTypeNotifier() : super(ToggleableButtonsState.unselected);

  void setIncome() => value = ToggleableButtonsState.income;
  void setExpense() => value = ToggleableButtonsState.expense;

  get hasValidType => value != ToggleableButtonsState.unselected;
}

enum ToggleableButtonsState {
  unselected([false, false], ''),
  income([true, false], 'income'),
  expense([false, true], 'expense');

  const ToggleableButtonsState(this.state, this.value);
  final List<bool> state;
  final String value;
}
