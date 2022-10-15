import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../new_transaction/new_transaction_sheet.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1120) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 200,
          color: AppColors.gray1,
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/Logo.png'),
                PrimaryButton(
                  label: 'Nova transação',
                  buttonSize: ButtonSize.medium,
                  onPressed: () => _showNewTransactionForm(context),
                ),
              ],
            ),
          ),
        );
      }
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 200,
        color: AppColors.gray1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/Logo.png'),
            PrimaryButton(
              label: 'Nova transação',
              onPressed: () => _showNewTransactionForm(context),
            ),
          ],
        ),
      );
    });
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
