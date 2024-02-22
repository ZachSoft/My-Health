import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class TratingBarIndicator extends StatelessWidget {
  const TratingBarIndicator({
    super.key,
    required this.rating,
    this.itemsize = 20,
  });
  final double rating;
  final double itemsize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      rating: rating,
      itemSize: itemsize,
      unratedColor: Tcolors.grey,
      itemBuilder: (_, __) => const Icon(
        Iconsax.star1,
        color: Tcolors.primary,
      ),
    );
  }
}
