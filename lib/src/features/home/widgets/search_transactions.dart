import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/transactions_provider.dart';
import '../../../shared/widgets/default_textfield.dart';

class SearchTransactions extends StatefulWidget {
  const SearchTransactions({super.key});

  @override
  State<SearchTransactions> createState() => _SearchTransactionsState();
}

class _SearchTransactionsState extends State<SearchTransactions> {
  Timer? _debounce;

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final transactionsStore = context.read<TransactionsStore>();
      transactionsStore.searchTransaction(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Container(
              height: 48,
              constraints: const BoxConstraints(maxWidth: 1168),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              transform: Matrix4.translationValues(0.0, -12.0, 0.0),
              child: DefaultTextField(
                hint: 'Busque por uma transação',
                onChanged: _onSearchChanged,
              ),
            );
          },
        ));
  }
}
