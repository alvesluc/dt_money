import 'package:dt_money/src/features/home/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../services/shared_preferences_service/shared_preferences_service.dart';
import '../../shared/colors.dart';
import '../../shared/text_field_validators.dart';
import '../../shared/widgets/default_textfield.dart';
import '../../shared/widgets/primary_button.dart';
import '../home/new_transaction_controller.dart';
import 'widgets/toggleable_expense_button.dart';
import 'widgets/toggleable_income_button.dart';

class NewTransactionDialog extends StatefulWidget {
  const NewTransactionDialog({super.key});

  @override
  State<NewTransactionDialog> createState() => _NewTransactionDialogState();
}

class _NewTransactionDialogState extends State<NewTransactionDialog> {
  final formKey = GlobalKey<FormState>();

  String description = '';
  String price = '';
  String category = '';

  setDescription(String text) => description = text;
  setPrice(String text) => price = text;
  setCategory(String text) => category = text;

  var buttonsState = ToggleablesButtonsState.unselected;

  setButtonsState(ToggleablesButtonsState state) {
    setState(() {
      buttonsState = state;
    });
  }

  final newTransactionController = NewTransactionController(
    SharedPreferencesImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
              DefaultTextField(
                hint: 'Descrição',
                onChanged: setDescription,
                validator: TextFieldValidators.validateNotEmpty,
              ),
              const SizedBox(height: 12),
              DefaultTextField(
                hint: 'Preço',
                onChanged: setPrice,
                validator: TextFieldValidators.validateNotEmpty,
              ),
              const SizedBox(height: 12),
              DefaultTextField(
                hint: 'Categoria',
                onChanged: setCategory,
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
                  onPressed: hasValidButtonState
                      ? () {
                          _createNewTransaction(context);
                        }
                      : null,
                  buttonSize: ButtonSize.large,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createNewTransaction(context) async {
    if (formKey.currentState!.validate() && hasValidButtonState) {
      final transaction = TransactionModel(
        description: description,
        value: double.parse(price),
        category: category,
        type: TransactionType.values.byName(buttonsState.value),
      );
      await newTransactionController.newTransaction(transaction);
      Navigator.pop(context);
    }
  }

  bool get hasValidButtonState {
    return buttonsState != ToggleablesButtonsState.unselected;
  }
}

enum ToggleablesButtonsState {
  unselected([false, false], ''),
  income([true, false], 'income'),
  expense([false, true], 'expense');

  const ToggleablesButtonsState(this.state, this.value);
  final List<bool> state;
  final String value;
}
