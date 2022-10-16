import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class TransactionsHeader extends StatelessWidget {
  const TransactionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1168),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        transform: Matrix4.translationValues(0.0, -24.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Transações',
              style: TextStyle(fontSize: 18, color: AppColors.gray6),
            ),
            Text(
              '2 itens',
              style: TextStyle(fontSize: 16, color: AppColors.gray5),
            ),
          ],
        ),
      ),
    );
  }
}
