
import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TroundedImage extends StatelessWidget {
  const TroundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageurl,
    this.applyImageBorderRadius = true,
    this.border,
    this.backgroundcolor,
    this.fit,
    this.padding,
    this.isnetworkImage = false,
    this.onPressed,
    this.borderradius = Tsizes.md,
  });

  final double? width, height;
  final double borderradius;
  final String imageurl;
  final bool applyImageBorderRadius;
  final BoxBorder? border;
  final Color? backgroundcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isnetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(borderradius)),
        child: ClipRRect(
          borderRadius: applyImageBorderRadius
              ? BorderRadius.circular(borderradius)
              : BorderRadius.zero,
          child: Image(
            image: isnetworkImage
                ? NetworkImage(imageurl)
                : AssetImage(imageurl) as ImageProvider,
            fit: fit,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
