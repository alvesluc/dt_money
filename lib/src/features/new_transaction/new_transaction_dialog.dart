import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dashboard_provider.dart';
import '../../providers/transactions_provider.dart';
import '../../shared/colors.dart';
import '../../shared/text_field_validators.dart';
import '../../shared/widgets/default_textfield.dart';
import '../../shared/widgets/primary_button.dart';
import '../home/models/transaction.dart';
import 'new_transaction_store.dart';
import 'widgets/new_transaction_header.dart';
import 'widgets/toggleable_buttons_row.dart';

class NewTransactionDialog extends StatefulWidget {
  const NewTransactionDialog({super.key});

  @override
  State<NewTransactionDialog> createState() => _NewTransactionDialogState();
}

class _NewTransactionDialogState extends State<NewTransactionDialog> {
  final formKey = GlobalKey<FormState>();

  final store = NewTransactionStore();

  final currencyFormatter = CurrencyTextInputFormatter(
    decimalDigits: 2,
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  var autovalidateMode = AutovalidateMode.onUserInteraction;

  void setAutoValidateMode() {
    setState(() => autovalidateMode = AutovalidateMode.always);
  }

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
              const NewTransactionHeader(),
              const SizedBox(height: 24),
              DefaultTextField(
                hint: 'Descrição',
                onChanged: store.setDescription,
                validator: TextFieldValidators.validateNotEmpty,
                autovalidateMode: autovalidateMode,
              ),
              const SizedBox(height: 12),
              DefaultTextField(
                hint: 'Preço',
                initialValue: 'R\$ 0,00',
                keyboardType: TextInputType.number,
                inputFormatters: [currencyFormatter],
                onChanged: (text) {
                  num value = currencyFormatter.getUnformattedValue();
                  store.setValue(value);
                },
                validator: (_) {
                  return TextFieldValidators.validateNotZero(store.value);
                },
                autovalidateMode: autovalidateMode,
              ),
              const SizedBox(height: 12),
              DefaultTextField(
                hint: 'Categoria',
                onChanged: store.setCategory,
                validator: TextFieldValidators.validateNotEmpty,
                autovalidateMode: autovalidateMode,
              ),
              const SizedBox(height: 16),
              ToggleableButtonsRow(
                transactionTypeNotifier: store.typeNotifier,
                setIncome: store.typeNotifier.setIncome,
                setExpense: store.typeNotifier.setExpense,
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: store.typeNotifier,
                builder: (context, type, _) {
                  return SizedBox(
                    width: double.maxFinite,
                    child: PrimaryButton(
                      label: 'Cadastrar',
                      enabled: store.typeNotifier.hasValidType,
                      onPressed: () => validateForm(context),
                      buttonSize: ButtonSize.large,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateForm(BuildContext context) async {
    final transactionStore = context.read<TransactionsStore>();
    final dashboardStore = context.read<DashboardStore>();

    if (formKey.currentState!.validate()) {
      final transaction = TransactionModel(
        description: store.description,
        value: store.value,
        category: store.category,
        type: TransactionType.values.byName(store.typeNotifier.value.name),
        entryDate: DateTime.now(),
      );

      await transactionStore.addTransaction(transaction);
      await dashboardStore.updateDashboard(transaction);

      Navigator.pop(context);
    }
  }
}
