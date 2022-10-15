import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';

class ToggleableIncomeButton extends StatelessWidget {
  const ToggleableIncomeButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });

  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? AppColors.greenDark : AppColors.gray3,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIcons.arrowCircleUp,
            color: isSelected ? AppColors.white : AppColors.greenLight,
          ),
          const SizedBox(width: 8),
          const Text(
            'Entrada',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.white,
              height: 1.6,
            ),
          )
        ],
      ),
    );
  }
}
