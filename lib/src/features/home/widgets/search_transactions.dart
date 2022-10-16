import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/colors.dart';
import '../../../shared/extensions.dart';
import '../../../shared/widgets/default_textfield.dart';

class SearchTransactions extends StatelessWidget {
  const SearchTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Container(
              height: 48,
              constraints: const BoxConstraints(maxWidth: 1168),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              transform: Matrix4.translationValues(0.0, -12.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: DefaultTextField(hint: 'Busque por uma transação'),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: double.maxFinite,
                    child: Builder(
                      builder: (_) {
                        if (constraints.isDesktop) {
                          return OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 32,
                              ),
                              side: const BorderSide(
                                width: 1,
                                color: AppColors.greenLight,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  PhosphorIcons.magnifyingGlassBold,
                                  color: AppColors.greenLight,
                                  size: 20,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Buscar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greenLight,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            minimumSize: const Size(0, 0),
                            side: const BorderSide(
                              width: 1,
                              color: AppColors.greenLight,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                          child: const Icon(
                            PhosphorIcons.magnifyingGlassBold,
                            color: AppColors.greenLight,
                            size: 20,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
