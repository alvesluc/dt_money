import 'package:flutter/material.dart';

import '../colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: AppColors.green,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.white,
          height: 1.6,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
