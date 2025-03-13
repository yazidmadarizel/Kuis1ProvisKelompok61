import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    required crossAxisAlignment,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Transparan
      elevation: 0, // Hilangkan bayangan
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left, color: Colors.white))
          : leadingIcon != null
          ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon, color: Colors.white))
          : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
