import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/transactions_provider.dart';
import '../../../shared/colors.dart';
import '../../../shared/extensions.dart';
import '../../../shared/widgets/default_textfield.dart';

class SearchTransactions extends StatefulWidget {
  const SearchTransactions({super.key});

  @override
  State<SearchTransactions> createState() => _SearchTransactionsState();
}

class _SearchTransactionsState extends State<SearchTransactions> {
  String query = '';

  void _onChanged(String text) => query = text;

  void _onSearch(BuildContext context) {
    final transactionStore = context.read<TransactionsStore>();
    transactionStore.searchTransaction(query);
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DefaultTextField(
                      hint: 'Busque por uma transação',
                      onChanged: _onChanged,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: double.maxFinite,
                    child: Builder(
                      builder: (_) {
                        if (constraints.isDesktop) {
                          return OutlinedButton(
                            onPressed: () => _onSearch(context),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 32,
                              ),
                              side: const BorderSide(
                                width: 1,
                                color: AppColors.greenLight,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  PhosphorIcons.magnifyingGlassBold,
                                  color: AppColors.greenLight,
                                  size: 20,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Buscar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greenLight,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return OutlinedButton(
                          onPressed: () => _onSearch(context),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            minimumSize: const Size(0, 0),
                            side: const BorderSide(
                              width: 1,
                              color: AppColors.greenLight,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                          child: const Icon(
                            PhosphorIcons.magnifyingGlassBold,
                            color: AppColors.greenLight,
                            size: 20,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
