import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TShadowStyle {
  static final BoxShadow verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.8),
    blurRadius: 58,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final BoxShadow horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 58,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
