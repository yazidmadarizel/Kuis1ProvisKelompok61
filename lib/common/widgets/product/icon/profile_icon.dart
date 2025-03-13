import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key, required this.onPressed, this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.user, color: TColors.white)),

      ],
    );
  }
}

