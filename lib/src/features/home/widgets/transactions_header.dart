import 'package:dt_money/src/shared/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';

class TransactionsHeader extends StatelessWidget {
  const TransactionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          transform: Matrix4.translationValues(0.0, -24.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Transações',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.gray6,
                ),
              ),
              Text(
                '2 itens',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.gray5,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          transform: Matrix4.translationValues(0.0, -12.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: DefaultTextField(hint: 'Busque por uma transação'),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(16),
                  minimumSize: const Size(0, 0),
                  side: const BorderSide(
                    width: 1,
                    color: AppColors.greenLight,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                ),
                child: const Icon(
                  PhosphorIcons.magnifyingGlassBold,
                  color: AppColors.greenLight,
                  size: 22,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
