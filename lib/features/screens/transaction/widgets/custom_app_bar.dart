import 'package:flutter/material.dart';
import 'package:quiz_1/utils/constants/sizes.dart';
import 'package:quiz_1/utils/device/device_utility.dart';
import 'package:quiz_1/utils/helpers/helper_functions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingOnPressed,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: foregroundColor),
        )
            : leadingIcon != null
            ? IconButton(
          onPressed: leadingOnPressed,
          icon: Icon(leadingIcon, color: foregroundColor),
        )
            : null,
        title: title,
        actions: actions,
        backgroundColor: backgroundColor ?? Colors.transparent,
        elevation: 0,
        centerTitle: false,
        foregroundColor: foregroundColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}