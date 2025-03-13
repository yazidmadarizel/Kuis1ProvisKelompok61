import 'package:quiz_1/common/widgets/texts/product_title_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class ProductTitleWithIcon extends StatelessWidget {
  const ProductTitleWithIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.productTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes productTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ProductTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            productTextSize: productTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}
