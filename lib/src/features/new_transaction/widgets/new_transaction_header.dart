import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';

class NewTransactionHeader extends StatelessWidget {
  const NewTransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Nova transação',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1.6,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 24,
          width: 24,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            icon: const Icon(PhosphorIcons.x, color: AppColors.gray5),
          ),
        ),
      ],
    );
  }
}
