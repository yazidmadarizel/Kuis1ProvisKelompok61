import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/constants/sizes.dart';

class CircularIcon extends StatelessWidget {
  /// A custom circular icon widget with a background color.
  ///
  /// Properties:
  /// - [width], [height], [backgroundColor] for the container.
  /// - [icon], [size], [color], and [onPressed] for the icon.
  const CircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.md,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width;
  final double? height;
  final double? size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 40.0,
      height: height ?? 40.0,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
