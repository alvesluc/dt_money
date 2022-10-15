import 'package:flutter/material.dart';

import '../colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.buttonSize = ButtonSize.small,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonSize buttonSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: onPressed != null ? AppColors.green : AppColors.gray5,
        padding: buttonSize.padding,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: buttonSize.fontSize,
          color: AppColors.white,
          height: 1.6,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

enum ButtonSize {
  small(EdgeInsets.symmetric(vertical: 8, horizontal: 16), 14),
  medium(EdgeInsets.symmetric(vertical: 12, horizontal: 20), 16),
  large(EdgeInsets.symmetric(vertical: 16, horizontal: 32), 16);

  const ButtonSize(this.padding, this.fontSize);
  final EdgeInsetsGeometry padding;
  final double fontSize;
}
