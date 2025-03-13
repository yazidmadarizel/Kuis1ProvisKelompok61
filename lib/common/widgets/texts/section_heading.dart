import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showActionButton)
            TextButton(
              onPressed: onPressed,
              child: Text(buttonTitle),
            )
        ],
      ),
    );
  }
}