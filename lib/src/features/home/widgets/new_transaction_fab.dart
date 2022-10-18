import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';
import '../../new_transaction/new_transaction_sheet.dart';

class NewTransactionFAB extends StatelessWidget {
  const NewTransactionFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.green,
      onPressed: () => _showNewTransactionForm(context),
      child: const Icon(
        PhosphorIcons.plus,
        color: AppColors.white,
      ),
    );
  }

  Future<void> _showNewTransactionForm(context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: AppColors.gray2,
      builder: (context) {
        return const NewTransactionSheet();
      },
    );
  }
}
