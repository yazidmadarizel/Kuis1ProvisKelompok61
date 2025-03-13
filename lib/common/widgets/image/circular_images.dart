import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = 8.0,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
