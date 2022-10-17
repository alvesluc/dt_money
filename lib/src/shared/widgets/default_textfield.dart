import 'package:flutter/material.dart';

import '../colors.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.hint,
    this.validator,
    this.onChanged,
  });

  final String hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: AppColors.gray1,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.gray5,
          height: 1.4,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.greenLight),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        contentPadding: const EdgeInsets.all(16),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }
}
