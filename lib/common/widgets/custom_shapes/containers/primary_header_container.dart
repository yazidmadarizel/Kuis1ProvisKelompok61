import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
    this.backgroundImage,
    this.backgroundColor = TColors.primary,
    required this.height,
  });

  final Widget child;
  final String? backgroundImage;
  final Color backgroundColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidgets(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundImage == null ? backgroundColor : null,
          image: backgroundImage != null
              ? DecorationImage(
            image: AssetImage(backgroundImage!),
            fit: BoxFit.cover,
          )
              : null,
        ),
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned.fill(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
