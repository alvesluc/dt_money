import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dt_money/src/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';

import '../../providers/transactions_provider.dart';
import '../../shared/text_field_validators.dart';
import '../../shared/widgets/default_textfield.dart';
import '../../shared/widgets/primary_button.dart';
import '../home/models/transaction.dart';
import 'new_transaction_store.dart';
import 'widgets/new_transaction_header.dart';
import 'widgets/toggleable_buttons_row.dart';
import 'package:provider/provider.dart';

class NewTransactionSheet extends StatefulWidget {
  const NewTransactionSheet({super.key});

  @override
  State<NewTransactionSheet> createState() => _NewTransactionSheetState();
}

class _NewTransactionSheetState extends State<NewTransactionSheet> {
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
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(24),
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
                      buttonSize: ButtonSize.medium,
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
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
