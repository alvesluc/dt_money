

import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/widgets/primary_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
