import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class PriceText extends StatelessWidget {
  final double amount;

  const PriceText({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp${amount.toStringAsFixed(0)}',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: TColors.primary,
      ),
    );
  }
}