import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.productTextSize = TextSizes.medium,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes productTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: productTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : productTextSize == TextSizes.medium
          ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
          : productTextSize == TextSizes.large
          ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
          : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
