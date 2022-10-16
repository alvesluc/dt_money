import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../shared/colors.dart';
import '../../shared/text_field_validators.dart';
import '../../shared/widgets/default_textfield.dart';
import '../../shared/widgets/primary_button.dart';
import 'widgets/toggleable_expense_button.dart';
import 'widgets/toggleable_income_button.dart';

class NewTransactionDialog extends StatefulWidget {
  const NewTransactionDialog({super.key});

  @override
  State<NewTransactionDialog> createState() => _NewTransactionDialogState();
}

class _NewTransactionDialogState extends State<NewTransactionDialog> {
  final formKey = GlobalKey<FormState>();

  var buttonsState = ToggleablesButtonsState.unselected;

  setButtonsState(ToggleablesButtonsState state) {
    setState(() {
      buttonsState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6)
      ),

      backgroundColor: AppColors.gray2,
      child: Container(
        padding: const EdgeInsets.all(48),
        width: 528,
        child: Form(
          key: formKey,
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
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
                  buttonSize: ButtonSize.large,
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
