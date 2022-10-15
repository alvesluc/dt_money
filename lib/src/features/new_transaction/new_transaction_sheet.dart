import 'package:dt_money/src/features/new_transaction/widgets/toggleable_expense_button.dart';
import 'package:dt_money/src/features/new_transaction/widgets/toggleable_income_button.dart';
import 'package:dt_money/src/shared/text_field_validators.dart';
import 'package:dt_money/src/shared/widgets/default_textfield.dart';
import 'package:dt_money/src/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../shared/colors.dart';

class NewTransactionSheet extends StatefulWidget {
  const NewTransactionSheet({super.key});

  @override
  State<NewTransactionSheet> createState() => _NewTransactionSheetState();
}

class _NewTransactionSheetState extends State<NewTransactionSheet> {
  final formKey = GlobalKey<FormState>();

  var buttonsState = ToggleablesButtonsState.unselected;

  setButtonsState(ToggleablesButtonsState state) {
    setState(() {
      buttonsState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nova transação',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        PhosphorIcons.x,
                        color: AppColors.gray5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const DefaultTextField(
                hint: 'Descrição',
                validator: TextFieldValidators.validateNotEmpty,
              ),
              const SizedBox(height: 12),
              const DefaultTextField(
                hint: 'Preço',
                validator: TextFieldValidators.validateNotEmpty,
              ),
              const SizedBox(height: 12),
              const DefaultTextField(
                hint: 'Categoria',
                validator: TextFieldValidators.validateNotEmpty,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ToggleableIncomeButton(
                      isSelected: buttonsState.state[0],
                      onPressed: () {
                        setButtonsState(ToggleablesButtonsState.income);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ToggleableExpenseButton(
                      isSelected: buttonsState.state[1],
                      onPressed: () {
                        setButtonsState(ToggleablesButtonsState.expense);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.maxFinite,
                child: PrimaryButton(
                  label: 'Cadastrar',
                  onPressed: hasValidButtonState ? _createNewTransaction : null,
                  buttonSize: ButtonSize.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createNewTransaction() {
    if (formKey.currentState!.validate() && hasValidButtonState) {
      Navigator.pop(context);
    }
  }

  bool get hasValidButtonState {
    return buttonsState != ToggleablesButtonsState.unselected;
  }
}

enum ToggleablesButtonsState {
  unselected([false, false]),
  income([true, false]),
  expense([false, true]);

  const ToggleablesButtonsState(this.state);
  final List<bool> state;
}
