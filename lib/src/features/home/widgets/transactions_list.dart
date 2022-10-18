import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/transactions_provider.dart';
import '../../../shared/extensions.dart';
import '../../../shared/widgets/column_builder.dart';
import 'search_transactions.dart';
import 'transaction.dart';
import 'transactions_header.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TransactionsStore>().getTransactions();
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   TransactionsProvider.of(context).getTransactions();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<TransactionsStore>();
    final state = store.value;
    // final store = TransactionsProvider.of(context);
    // final state = store.value;

    if (state is LoadingTransactionsState) {
      return const CircularProgressIndicator.adaptive();
    }

    if (state is ErrorTransactionsState) {
      return const Text('Não foi possível recuperar suas transações');
    }

    if (state is SuccessTransactionsState) {
      return Column(
        children: [
          const TransactionsHeader(),
          const SearchTransactions(),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.isDesktop) {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1168),
                  child: ColumnBuilder(
                    itemCount: state.transactions.length,
                    itemBuilder: (context, i) {
                      return Transaction(transaction: state.transactions[i]);
                    },
                    separatorBuilder: (context, i) => const SizedBox(height: 8),
                  ),
                ),
              );
            }
            return ColumnBuilder(
              itemCount: state.transactions.length,
              itemBuilder: (context, i) {
                return Transaction(transaction: state.transactions[i]);
              },
              separatorBuilder: (context, i) => const SizedBox(height: 12),
            );
          }),
        ],
      );
    }

    return const CircularProgressIndicator.adaptive();
  }
}
