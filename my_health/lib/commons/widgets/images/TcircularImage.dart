import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

import 'package:flutter/material.dart';

class TcircularImage extends StatelessWidget {
  const TcircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = Tsizes.sm,
    required this.image,
    this.backgroundcolor,
    this.overlaycolor,
    this.fit = BoxFit.cover,
    this.isnetworkImage = false,
  });

  final double width, height, padding;
  final String image;

  final Color? backgroundcolor;
  final Color? overlaycolor;
  final BoxFit? fit;
  final bool isnetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: dark ? Tcolors.dark : Tcolors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isnetworkImage
              ? CachedNetworkImage(
                  color: overlaycolor,
                  fit: fit,
                  imageUrl: image,
                  height: height,
                  width: width,
                  progressIndicatorBuilder: (context, url, progress) =>
                      ShimmerEffect(
                    height: height,
                    width: width,
                    radius: width,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: isnetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlaycolor,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
